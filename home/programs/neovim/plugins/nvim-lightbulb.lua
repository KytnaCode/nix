require("nvim-lightbulb").setup({
  hide_in_unfocused_buffer = true,
  link_highlights = true,
  sign = { enable = false },
  autocmd = {
    enable = true,
    updateTime = 100,
    events = { "CursolHold", "CursorHoldI" },
  },
})
