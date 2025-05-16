local function get_pylint_path()
	local venv = os.getenv("VIRTUAL_VENV") or (vim.fn.getcwd() .. "/.venv")
	return venv .. "/Scripts/pylint.exe"
end

return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		local python_venv = vim.fn.getcwd() .. "/.venv/Script/pylint.exe"

		-- Setting up sources
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua, -- Lua

				null_ls.builtins.diagnostics.pylint.with({
					command = get_pylint_path(),
				}), -- Python
				null_ls.builtins.formatting.black,
			},
		})

		-- Formats from the default LSP format
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
