local lint = require("lint")

lint.linters.qmllint = {
  cmd = "qmllint",
  stdin = false,
  args = {
    "-E",
    "--dry-run",
  },
}

vim.env.ESLINT_D_PPID = vim.fn.getpid()
lint.linters_by_ft = {
  lua = { "selene" },
  nix = { "statix" },
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  qml = { "qmllint" },
  go = { "golangcilint" },
}
