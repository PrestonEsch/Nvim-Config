return { -- Night Owl Color Theme
   { 
      "oxfist/night-owl.nvim",
      lazy = false,
      priority = 1000,

      config = function()
         vim.cmd.colorscheme "night-owl"
      end,
   },

   -- Catppuccin Theme
--   {
--      "catppuccin/nvim",
--      name = "catppuccin",
--      
--      config = function()
--         vim.cmd.colorscheme "catppuccin"
--      end,
--   }
}
