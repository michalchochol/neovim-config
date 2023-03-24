local M = {}

M.config = function()


  -- debugging keymappings
  -- lvim.keys.normal_mode["F5"] = ":lua require'dap'.continue()<CR>"
  -- lvim.keys.normal_mode["F10"] = ":lua require'dap'.step_over()<CR>"
  -- lvim.keys.normal_mode["F11"] = ":lua require'dap'.step_into()<CR>"
  -- lvim.keys.normal_mode["F12"] = ":lua require'dap'.step_out()<CR>"
  lvim.keys.normal_mode["<leader>b"] = ":lua require'dap'.toggle_breakpoint()<CR>"
  -- lvim.keys.normal_mode["<leader>B"] = ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>"
  -- lvim.keys.normal_mode["<leader>lp"] = ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>"
  -- lvim.keys.normal_mode["<leader>dr"] = ":lua require'dap'.repl.open()<CR>"


end

return M
