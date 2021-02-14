local dap = require("dap")
local map = vim.api.nvim_set_keymap

vim.g.dap_virtual_text = true

vim.fn.sign_define(
  "DapBreakpoint",
  {text = "🛑", texthl = "", linehl = "", numhl = ""}
)
vim.fn.sign_define(
  "DapStopped",
  {text = "➡️", texthl = "", linehl = "", numhl = ""}
)

dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = {
    os.getenv("HOME") .. "/repos/vscode-node-debug2/out/src/nodeDebug.js"
  }
}

local javascript = {
  {
    type = "node2",
    request = "attach",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    console = "integratedTerminal",
    skipFiles = {"<node_internals>/**/*.js"}
  }
}

dap.configurations.javascript = javascript
dap.configurations.javascriptreact = javascript

-- mappings
local opts = {noremap = true, silent = true}
-- TODO: fix mappings
map("n", "dh", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
map("n", "nc", ":lua require'dap'.continue()<CR>", opts)
map("n", "nn", ":lua require'dap'.step_over()<CR>", opts)
map("n", "ni", ":lua require'dap'.step_into()<CR>", opts)
map("n", "dr", ":lua require'dap'.repl.open({}, 'vsplit')<CR>", opts)
map("n", "no", ":lua require'dap.ui.variables'.scopes()<CR>", opts)
map("n", "di", ":lua require'dap.ui.variables'.visual_hover()<CR>", opts)
map(
  "n",
  "di",
  ":lua require'dap.ui.variables'.hover(function() return vim.fn.expand('<cexpr>') end)<CR>",
  opts
)
