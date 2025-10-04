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

vim.lsp.config("qmlls", {
  cmd = { "qmlls", "-E" },
})

vim.lsp.enable("gopls")

vim.lsp.enable("basedpyright")

-- vim.lsp.enable("hls") -- haskell-tools.nvim automatically configures hls.

vim.lsp.enable("clangd")

vim.lsp.enable("rust_analyzer")

vim.lsp.enable("bashls")
