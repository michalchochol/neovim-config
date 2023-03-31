local M = {}

M.config = function()
  -- Additional Plugins
  lvim.plugins = {
    { "ravenxrz/DAPInstall.nvim" },
    { "theHamsta/nvim-dap-virtual-text" },
    { "nvim-telescope/telescope-dap.nvim" },
    { "vim-test/vim-test" },
    { "lunarvim/onedarker.nvim" },
    -- {
    --   "shaunsingh/solarized.nvim",
    --   name = "solarized",
    --   config = function()
    --     -- require('solarized').set()
    --     require("user.theme").solarized()
    --     lvim.colorscheme = "solarized"
    --     vim.g.solarized_italic_comments = true
    --     vim.g.solarized_italic_keywords = true
    --     vim.g.solarized_italic_functions = true
    --     vim.g.solarized_italic_variables = false
    --     vim.g.solarized_contrast = true
    --     vim.g.solarized_borders = false
    --     vim.g.solarized_disable_background = false
    --   end
    -- },
    -- {
    -- "rose-pine/neovim",
    --   name = "rose-pine",
    --   config = function()
    --     require("user.theme").rose_pine()
    --     lvim.colorscheme = "rose-pine"
    --   end,
    --   cond = function()
    --     local _time = os.date "*t"
    --     return (_time.hour >= 1 and _time.hour < 9) and lvim.builtin.time_based_themes
    --     -- return false
    --   end,
    -- },
    -- {
    --   "catppuccin/nvim",
    --   name = "catppuccin",
    --   config = function()
    --     require("user.theme").catppuccin()
    --     -- local _time = os.date "*t"
    --     -- if (_time.hour >= 17 and _time.hour < 21) and lvim.builtin.time_based_themes then
    --     lvim.colorscheme = "catppuccin-latte"
    --     -- end
    --   end,
    -- },
  }
end

return M
