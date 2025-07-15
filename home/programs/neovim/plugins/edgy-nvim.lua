require("edgy").setup({
  left = {
    {
      ft = "neo-tree",
      size = { width = 0.28 },
    },
  },
  bottom = {
    {
      ft = "toggleterm",
      size = { height = 0.36 },
      filter = function(_, win)
        return vim.api.nvim_win_get_config(win).relative == ""
      end,
    },
  },
  right = {
    {
      ft = "gitcommit",
      size = { width = 0.4 },
    },
    -- Git log and other git stuff
    {
      ft = "git",
      size = { width = 0.5 },
    },
  },
})
