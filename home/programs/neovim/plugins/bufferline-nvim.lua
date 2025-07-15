vim.cmd.colorscheme(vim.g.colorscheme) -- Ensure colorscheme is loaded.

require("bufferline").setup({
  highlights = require("catppuccin.groups.integrations.bufferline").get(),
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
