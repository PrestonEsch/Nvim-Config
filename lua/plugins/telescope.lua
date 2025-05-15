return { -- Telescope file finder
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },

        config = function()
            -- Getting builtin function and setting keybinds
            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<Leader>p", builtin.find_files, {})
            vim.keymap.set("n", "<Leader>g", builtin.live_grep, {})
            vim.keymap.set("n", "<Leader>r", builtin.oldfiles, {})
        end,
    },

    { -- Telescope for code actions
        "nvim-telescope/telescope-ui-select.nvim",

        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        -- More Opts
                    },
                },
            })

            require("telescope").load_extension("ui-select")
        end,
    },
}
