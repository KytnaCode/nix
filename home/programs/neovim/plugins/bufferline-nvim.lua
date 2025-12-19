vim.cmd.colorscheme(vim.g.colorscheme) -- Ensure colorscheme is loaded.

require("bufferline").setup({
  highlights = require("catppuccin.special.bufferline").get_theme(),
  options = {
    offsets = {
      {
        filetype = "neo-tree",
        text = "Explorer",
        text_align = "center",
        separator = true,
      },
    },
  },
})
