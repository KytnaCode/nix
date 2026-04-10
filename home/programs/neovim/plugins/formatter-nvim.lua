local function toggle(formatter, name, default)
  if vim.g[name] == nil then
    vim.g[name] = default
  end

  return function()
    local opt = vim.g[name]

    if opt == nil then
      opt = default
    end

    if opt == 1 then
      if type(formatter) == "function" then
        formatter = formatter()
      end

      return formatter
    end

    return nil
  end
end

local function rustfmt()
  local conf = require("formatter.filetypes.rust").rustfmt()
  conf.args = {}
  return conf
end

local qmlformat = {
  exe = "qmlformat",
  args = {
    "--inplace",
  },
  stdin = false,
}

local golangci = {
  exe = "golangci-lint",
  args = {
    "fmt",
  },
}

require("formatter").setup({
  filetype = {
    lua = {
      toggle(require("formatter.filetypes.lua").stylua, "stylua", 1),
    },
    nix = {
      toggle(require("formatter.filetypes.nix").alejandra, "alejandra", 1),
    },
    json = {
      toggle(require("formatter.filetypes.json").prettierd, "prettier", 1),
    },
    yaml = {
      toggle(require("formatter.filetypes.yaml").prettierd, "prettier", 1),
    },
    javascript = {
      toggle(require("formatter.filetypes.javascript").eslint_d, "eslint", 0),
      toggle(require("formatter.filetypes.javascript").prettierd, "prettier", 1),
    },
    typescript = {
      toggle(require("formatter.filetypes.typescript").eslint_d, "eslint", 0),
      toggle(require("formatter.filetypes.typescript").prettierd, "prettier", 1),
    },
    javascriptreact = {
      toggle(require("formatter.filetypes.javascriptreact").eslint_d, "eslint", 0),
      toggle(require("formatter.filetypes.javascriptreact").prettierd, "prettier", 1),
    },
    typescriptreact = {
      toggle(require("formatter.filetypes.typescriptreact").eslint_d, "eslint", 0),
      toggle(require("formatter.filetypes.typescriptreact").prettierd, "prettier", 1),
    },
    python = {
      toggle(require("formatter.filetypes.python").black, "black", 1),
    },
    haskell = {
      toggle(require("formatter.filetypes.haskell").ormolu, "ormolu", 1),
    },
    rust = {
      toggle(rustfmt, "rustfmt", 1),
    },
    sh = {
      toggle(require("formatter.filetypes.sh").shfmt, "shfmt", 1),
    },
    qml = {
      toggle(qmlformat, "qmlformat", 1),
    },
    go = {
      toggle(golangci, "golangci-fmt", 1),
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
})
