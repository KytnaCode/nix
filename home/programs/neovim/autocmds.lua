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
local function filter()
  if vim.bo.buftype ~= "" then
    return false
  end

  return true
end

augroup("NumberColumn", { clear = true })
autocmd("ModeChanged", {
  group = "NumberColumn",
  pattern = { "*:n", "*:v" },
  callback = function()
    if not filter() then
      return
    end

    vim.wo.relativenumber = true
  end,
})

autocmd("ModeChanged", {
  group = "NumberColumn",
  pattern = "*:i",
  callback = function()
    if not filter() then
      return
    end

    vim.wo.relativenumber = false
  end,
})
