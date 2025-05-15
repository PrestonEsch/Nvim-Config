return { -- Tree sitter
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
        -- Getting tree config
        local tree_config = require("nvim-treesitter.configs")

        -- Setting up config
        tree_config.setup({
            auto_install = true,

            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
