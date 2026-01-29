local api = vim.api
local cmd = api.nvim_create_user_command

local dap, dapui = require("dap"), require("dapui")

cmd("DapExit", function()
  dap.terminate()
  dapui.close()
end, {
  desc = "terminate dap session and close dap ui",
})
