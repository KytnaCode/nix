vim.filetype.add({
  extension = {
    env = "env",
  },
  pattern = {
    [".env.*"] = "env",
  },
})
