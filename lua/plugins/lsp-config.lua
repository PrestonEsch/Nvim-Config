local function get_ruff_path(workspace)
	local python_path = vim.env.PYTHON_VENV_PATH

	if python_path then
		return python_path
	end

	-- Look for venvs in workplace
	local venv_paths = {
		workspace .. "/.venv/bin/ruff",
		workspace .. "/.venv/Scripts/ruff.exe",
		workspace .. "/venv/Scripts/ruff.exe",
		workspace .. "/venv/bin/ruff",
	}

	for _, path in ipairs(venv_paths) do
		if vim.fn.filereadable(path) == 1 then
			return path
		end
	end

	-- Falback to system python
	return vim.fn.exepath("python3") or vim.fn.exepath("python")
end

return {
	{
		"williamboman/mason.nvim",

		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",

		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls", -- Lua Language Server
					"ruff", -- Python
					"glsl_analyzer", -- GLSL
                    "sqlls",
				},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",

		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- Starting up all LS
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.ruff.setup({
				path = get_ruff_path(vim.fn.getcwd()),
				command = get_ruff_path(vim.fn.getcwd()),
				capabilities = capabilities,
			})

			lspconfig.glsl_analyzer.setup({
				capabilities = capabilities,
			})

            lspconfig.sqlls.setup({
				capabilities = capabilities,
			})

			-- Keybinds for LSP
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
