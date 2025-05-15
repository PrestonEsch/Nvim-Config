return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        -- Setting up sources
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua, -- Lua

                null_ls.builtins.diagnostics.pylint, -- Python
                null_ls.builtins.formatting.black,
            },
        })

        -- Formats from the default LSP format
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
