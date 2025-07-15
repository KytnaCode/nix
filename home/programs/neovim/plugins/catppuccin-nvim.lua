require("catppuccin").setup({
  flavour = "latte",
  integrations = {
    dashboard = true,
    leap = true,
    lsp_trouble = true,
    markdown = true,
    mini = {
      enabled = true,
    },
    neotree = true,
    snacks = {
      enabled = true,
      indenscope_color = "mauve",
    },
    telescope = {
      enabled = true,
    },
    treesitter = true,
  },
})

vim.cmd.colorscheme(vim.g.colorscheme)
