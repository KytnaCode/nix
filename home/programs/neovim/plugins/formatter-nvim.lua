local util = require("formatter.util")

require("formatter").setup({
  filetype = {
    lua = {
      require("formatter.filetypes.lua").stylua,
    },
    nix = {
      require("formatter.filetypes.nix").alejandra,
    },
    json = {
      require("formatter.filetypes.json").prettierd,
    },
    yaml = {
      require("formatter.filetypes.yaml").prettierd,
    },
    javascript = {
      require("formatter.filetypes.javascript").prettierd,
    },
    typescript = {
      require("formatter.filetypes.typescript").prettierd,
    },
    javascriptreact = {
      require("formatter.filetypes.javascriptreact").prettierd,
    },
    typescriptreact = {
      require("formatter.filetypes.typescriptreact").prettierd,
    },
    haskell = {
      require("formatter.filetypes.haskell").ormolu,
    },
    qml = {
      function()
        return {
          exe = "qmlformat",
          args = {
            util.escape_path(util.get_current_buffer_file_path()),
          },
          stdin = false,
        }
      end,
    },
    go = {
      function()
        return {
          exe = "golangci-lint",
          args = {
            "fmt",
            "--stdin",
          },
          stdin = true,
        }
      end,
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
})
