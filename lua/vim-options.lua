-- Basic Settings (Tabing, Some keymap, etc.)
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Auto updates the LSP feedback while in insert, and formats the message
vim.diagnostic.config({
    virtual_text = {
        spacing = 6,
    },
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
})

-- Line Numbers
vim.opt.number = true

vim.g.mapleader = " "

-- Global keybinds to open files (Personal Guide, todo-list, etc)
vim.keymap.set("n", "<Leader>?", function()
    local config_dir = vim.fn.fnamemodify(vim.env.MYVIMRC, ":h")
    vim.cmd("edit " .. config_dir .. "/guide.md")
end, { desc = "Open guide.md in config dir" })

vim.keymap.set("n", "<Leader>d", function()
    local config_dir = vim.fn.fnamemodify(vim.env.MYVIMRC, ":h")
    vim.cmd("edit " .. config_dir .. "/todo.md")
end, { desc = "Open the todo list that lives in the config dir" })
