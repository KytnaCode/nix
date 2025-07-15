require("snacks").setup({
  image = { enabled = true },
  input = { enabled = true },
  quickfile = { enabled = true },
  bigfile = { enabled = true },
  notifier = {
    enabled = true,
    width = { min = 50, max = 0.6 },
    height = { min = 1, max = 0.8 },
    margin = { top = 1, right = 1 },
  },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },

  styles = {
    notification = {
      wo = {
        wrap = true,
      },
    },
  },
})
