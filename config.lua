-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--

-- theme
lvim.colorscheme = "tokyonight"
lvim.format_on_save.enabled = true

-- keymappings -------------------
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
-- edition
lvim.keys.normal_mode["<C-S-Up>"] = "ddkP"
lvim.keys.normal_mode["<C-S-Down>"] = "ddp"


-- plugins ----------------------
lvim.plugins = {
  { "ravenxrz/DAPInstall.nvim" },
  { "theHamsta/nvim-dap-virtual-text" },
  { "nvim-telescope/telescope-dap.nvim" },
  { "vim-test/vim-test" },
  {
    "folke/todo-comments.nvim",
    -- requires = "nvim-lua/plenary.nvim",
    config = function()
      -- require("todo-comments").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      -- }
    end
  }
}

-- debug --------------------------
local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

dap.adapters.go = function(callback, _)
  local stdout = vim.loop.new_pipe(false)
  local handle
  local pid_or_err
  local port = 38697
  local opts = {
    stdio = { nil, stdout },
    args = { "dap", "-l", "127.0.0.1:" .. port },
    detached = true,
  }
  handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
    stdout:close()
    handle:close()
    if code ~= 0 then
      print("dlv exited with code", code)
    end
  end)
  assert(handle, "Error running dlv: " .. tostring(pid_or_err))
  stdout:read_start(function(err, chunk)
    assert(not err, err)
    if chunk then
      vim.schedule(function()
        require("dap.repl").append(chunk)
      end)
    end
  end)
  -- Wait for delve to start
  vim.defer_fn(function()
    callback { type = "server", host = "127.0.0.1", port = port }
  end, 100)
end
-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "go",
    name = "Debug",
    request = "launch",
    program = "${file}",
  },
  {
    type = "go",
    name = "Debug with args",
    request = "launch",
    program = "${file}",
    args = function()
      local argument_string = vim.fn.input "Program arg(s): "
      return vim.fn.split(argument_string, " ", true)
    end,
  },
  {
    type = "go",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "${file}",
  },
  -- works with go.mod packages and sub packages
  {
    type = "go",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}",
  },
}
