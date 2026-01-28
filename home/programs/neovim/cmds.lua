local api = vim.api
local cmd = api.nvim_create_user_command

local dap, dapui = require("dap"), require("dapui")

cmd("DapTerminate", function()
  dap.termiante()
  dapui.close()
end, {
  desc = "terminate dap session and close dap ui",
})
