local function get_pylint_path()
	local venv = os.getenv("VIRTUAL_VENV") or (vim.fn.getcwd() .. "/.venv")
    local pylint = venv .. "/Scripts/pylint.exe"

    -- Checking if it really exists
    if vim.fn.filereadable(pylint) == 1 then
        return pylint
    end
    return nil
end

return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		-- Setting up sources
		null_ls.setup({
			sources = {
				-- Lua
				null_ls.builtins.formatting.stylua,

				-- Python
				null_ls.builtins.diagnostics.pylint.with({
					command = get_pylint_path(),

                    extra_args = {
                        "--output-format=json",
                    }
				}),
				null_ls.builtins.formatting.black,
			},
		})

		-- Formats from the default LSP format
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
