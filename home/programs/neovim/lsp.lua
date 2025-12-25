local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
  "nil_ls",
  "lua_ls",
  "jsonls",
  "yamlls",
  "ts_ls",
  "tailwindcss",
  "cssls",
  "html",
  "qmlls",
  "gopls",
  "basedpyright",
  "clangd",
  "rust_analyzer",
  "bashls",
}

local config = {
  ["nil_ls"] = {
    formatting = {
      command = "alejandra",
    },
  },
  ["qmlls"] = {
    cmd = { "qmlls", "-E" },
  },
}

for _, server in pairs(servers) do
  local conf = vim.tbl_extend("keep", config[server] or {}, capabilities)

  vim.lsp.config(server, conf)
  vim.lsp.enable(server)
end
