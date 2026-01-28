local dap, dapui = require("dap"), require("dapui")

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end

vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { test = "🟡", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { test = "🔵", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { test = "🟡", texthl = "", linehl = "", numhl = "" })
