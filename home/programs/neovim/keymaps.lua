local map = vim.keymap.set

local lint = require("lint")

-- Ensure snacks is loaded.
require("snacks")

local function opts(o)
  local def = {
    silent = true,
    noremap = true,
  }

  if o == nil then
    return def
  end

  return vim.tbl_extend("force", def, o)
end

-- Editing
map("i", [[<c-n>]], "<CMD>normal $<CR>", opts({ desc = "go to end of line" }))
map("i", [[<c-b>]], "<CMD>normal ^<CR>", opts({ desc = "got to start of line" }))
map("n", [[<leader>rn]], "<CMD>IncRename<CR>", opts({ desc = "rename symbol under cursor" }))
map("n", [[<leader>xx]], "<CMD>Trouble diagnostics<CR>", opts({ desc = "open diagnostics" }))
map({ "n", "v" }, [[d]], [["_d]], opts())
map({ "n", "x", "o" }, [[<C-s>]], "<Plug>(leap)")

-- Buffers
map({ "n", "i", "v" }, [[<C-f>]], "<CMD>Format<CR>", opts({ desc = "Format file" }))
map({ "n", "i", "v" }, [[<C-l>]], lint.try_lint, opts({ desc = "lint file" }))

map("n", [[<]], function()
  if vim.bo.filetype == "neo-tree" then
    return
  end

  vim.cmd.bp()
end, opts({ desc = "prev buffer" }))

map("n", [[>]], function()
  if vim.bo.filetype == "neo-tree" then
    return
  end

  vim.cmd.bn()
end, opts({ desc = "next buffer" }))

map("n", [[<A-S-.>]], "<CMD>BufferLineMoveNext<CR>", opts({ desc = "move right current buffer tab" }))
map("n", [[<A-S-,>]], "<CMD>BufferLineMovePrev<CR>", opts({ desc = "move left current buffer tab" }))
map("n", [[<A-c>]], Snacks.bufdelete.delete, opts({ desc = "close buffer" }))

-- File Explorer
map("n", [[<leader>tt]], "<CMD>Neotree<CR>", opts({ desc = "open file explorer" }))

-- Fuzzy Find
local builtins = require("telescope.builtin")

map("n", [[<leader>fg]], builtins.live_grep, opts({ desc = "grep string" }))
map("n", [[<leader>fb]], builtins.current_buffer_fuzzy_find, opts({ desc = "grep on current buffer" }))
map("n", [[<leader>ff]], builtins.find_files, opts({ desc = "find files" }))

-- Zen Mode
map("n", [[<leader>zz]], "<CMD>ZenMode<CR>", opts({ desc = "toggle zen mode" }))
map("n", [[<leader>zt]], "<CMD>Twilight<CR>", opts({ desc = "toggle twilight mode" }))

-- Term
map({ "n", "i", "t" }, [[<c-\>]], "<CMD>ToggleTerm direction=horizontal<CR>", opts({ desc = "toggle terminal" }))
map(
  { "n", "i", "t" },
  [[<c-f><c-\>]],
  "<CMD>ToggleTerm direction=float<CR>",
  opts({
    desc = "toggle floating terminal",
  })
)

-- Git
map("n", [[<leader>gc]], "<CMD>G commit -v<CR>", opts({ silent = false, desc = "commit changes" }))
