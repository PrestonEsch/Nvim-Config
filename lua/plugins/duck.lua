return {
    "tamton-aquib/duck.nvim",

    config = function()
        -- Keybinds to Hatch and Cook the duck
        vim.keymap.set("n", "<Leader>\\r", function()
            require("duck").hatch()
        end, {})
        vim.keymap.set("n", "<Leader>\\c", function()
            require("duck").cook()
        end, {})
    end,
}
