local api = vim.api
local cmd = api.nvim_create_user_command
local sessions = require("mini.sessions")

cmd("Sess", function(opts)
  local read = function()
    sessions.read(opts.args ~= "" and opts.args or nil, { force = opts.bang })
  end

  if vim.v.vim_did_enter == 1 then
    read()
  else
    api.nvim_create_augroup("SessionLoad", {})
    api.nvim_create_autocmd("VimEnter", {
      group = "SessionLoad",
      desc = "wait for Neovim to finish loading before reading session",
      callback = function()
        read()
      end,
      once = true,
    })
  end
end, {
  desc = "load session from file",
  nargs = "?",
  complete = "file",
  bang = true,
})
