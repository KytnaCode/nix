local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
  "astro",
  "basedpyright",
  "bashls",
  "clangd",
  "cssls",
  "docker_language_server",
  "gopls",
  "harper_ls",
  "html",
  "jsonls",
  "lua_ls",
  "nil_ls",
  "qmlls",
  "tailwindcss",
  "ts_ls",
  "yamlls",
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
  ["harper_ls"] = {
    settings = {
      ["harper-ls"] = {
        linters = {
          ViciousCircleOrCycle = true,
          BoringWords = true,
          ViciousCycle = true,
          SpelledNumbers = true,
        },
      },
    },
  },
  ["jsonls"] = {
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  },
  ["yamlls"] = {
    settings = {
      yaml = {
        SchemaStore = {
          enable = false,
          url = "",
        },
        schemas = require("schemastore").yaml.schemas(),
      },
    },
  },
}

for _, server in pairs(servers) do
  local conf = vim.tbl_extend("keep", config[server] or {}, capabilities)

  vim.lsp.config(server, conf)
  vim.lsp.enable(server)
end
