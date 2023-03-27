local M = {}

M.config = function()
  -- buffers
  lvim.keys.normal_mode["<A-Right>"] = "<cmd>BufferLineCycleNext<cr>"  -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )
  lvim.keys.normal_mode["<A-Left>"] = "<cmd>BufferLineCyclePrev<cr>"   -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )
  lvim.keys.normal_mode["<S-A-Right>"] = "<cmd>BufferLineMoveNext<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )
  lvim.keys.normal_mode["<S-A-Left>"] = "<cmd>BufferLineMovePrev<cr>"  -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )
  -- Better window navigation
  lvim.keys.normal_mode["<C-v>"] = ":vsplit<CR>"
  lvim.keys.normal_mode["<C-h>"] = ":split<CR>"
  lvim.keys.normal_mode["<S-Left>"] = "<C-w>h"
  lvim.keys.normal_mode["<S-Right>"] = "<C-w>l"
  lvim.keys.normal_mode["<S-Up>"] = "<C-w>k"
  lvim.keys.normal_mode["<S-Down>"] = "<C-w>j"
  lvim.keys.normal_mode["<S-q>"] = "<cmd>:q<cr>"
  -- terminal keymappings
  lvim.builtin.which_key.mappings["t"] = {
    name = "+Terminal",
    t = { "<cmd>ToggleTerm<cr>", "modal" },
    h = { "<cmd>ToggleTerm direction=horizontal size=20<cr>", "horizontal" },
    v = { "<cmd>ToggleTerm direction=vertical size=80<cr>", "vertical" },
  }
end



return M
