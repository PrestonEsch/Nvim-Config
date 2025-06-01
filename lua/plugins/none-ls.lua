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
                null_ls.builtins.formatting.ruff,
            },
        })

        -- Formats from the default LSP format
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
