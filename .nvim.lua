local function luaOptions()
  vim.wo.colorcolumn = "120"
end

local function nixOptions()
  vim.wo.colorcolumn = "120"
end

vim.api.nvim_create_augroup("ProjectSettings", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  group = "ProjectSettings",
  pattern = { "*.lua" },
  callback = luaOptions,
})

vim.api.nvim_create_autocmd("BufEnter", {
  group = "ProjectSettings",
  pattern = { "*.nix" },
  callback = nixOptions,
})
