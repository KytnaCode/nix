vim.lsp.enable("nil_ls")

vim.lsp.config("nil_ls", {
  formatting = {
    command = "alejandra",
  },
})

vim.lsp.enable("lua_ls")

vim.lsp.enable("jsonls")

vim.lsp.enable("yamlls")

vim.lsp.enable("ts_ls")

vim.lsp.enable("qmlls")

vim.lsp.enable("gopls")

vim.lsp.enable("clangd")
