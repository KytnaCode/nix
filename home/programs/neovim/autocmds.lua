local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("Formatting", { clear = true })
autocmd("BufWritePost", {
  group = "Formatting",
  command = "FormatWrite",
})

local lint = require("lint")

augroup("Linting", { clear = true })
autocmd("BufWritePost", {
  group = "Linting",
  callback = function()
    lint.try_lint()
  end,
})

-- Use relativenumber on normal and visual mode but no on insert mode.
augroup("NumberColumn", { clear = true })
autocmd("ModeChanged", {
  group = "NumberColumn",
  pattern = { "*:n", "*:v" },
  command = "set relativenumber",
})

autocmd("ModeChanged", {
  group = "NumberColumn",
  pattern = "*:i",
  command = "set norelativenumber",
})
