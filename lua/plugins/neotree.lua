return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
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

                    follow_current_file = false,
                    hijack_buffer_on_window_close = true,
                    use_libuv_file_watcher = true,
                    bind_to_cwd = false,

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
                {
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
