return { -- File Tree
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },

    config = function()
        require("neo-tree").setup({
            filesystem = {
                filtered_items = {
                    visible = false,

                    hide_gitignored = false,
                    hide_by_name = {
                        "__pycache__",
                    },

                    always_show = {
                        ".gitignore",
                    },
                },
            },

            event_handlers = {
                { -- Close Tree after file open
                    event = "file_open_requested",
                    handler = function(_)
                        require("neo-tree.command").execute({ action = "close" })
                    end,
                },
            },
        })

        vim.keymap.set("n", "<Leader>n", ":Neotree filesystem reveal left<CR>")
    end,
}
