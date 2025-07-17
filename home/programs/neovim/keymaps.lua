local map = vim.keymap.set

local lint = require("lint")

config.keymaps = {}

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

---@param bufnr number
function config.keymaps.gitsigns(bufnr)
  local gitsigns = require("gitsigns")

  local function m(mode, l, r, o)
    o = o or {}
    o.buffer = bufnr
    map(mode, l, r, o)
  end

  -- Navigation
  m("n", "]c", function()
    if vim.wo.diff then
      vim.cmd.normal({ "]c", bang = true })
    else
      gitsigns.nav_hunk("next")
    end
  end)

  m("n", "[c", function()
    if vim.wo.diff then
      vim.cmd.normal({ "[c", bang = true })
    else
      gitsigns.nav_hunk("prev")
    end
  end)

  -- Actions
  m("n", "<leader>hs", gitsigns.stage_hunk)
  m("n", "<leader>hr", gitsigns.reset_hunk)

  m("v", "<leader>hs", function()
    gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
  end)

  m("v", "<leader>hr", function()
    gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
  end)

  m("n", "<leader>hS", gitsigns.stage_buffer)
  m("n", "<leader>hR", gitsigns.reset_buffer)
  m("n", "<leader>hp", gitsigns.preview_hunk)
  m("n", "<leader>hi", gitsigns.preview_hunk_inline)

  m("n", "<leader>hb", function()
    gitsigns.blame_line({ full = true })
  end)

  m("n", "<leader>hd", gitsigns.diffthis)

  m("n", "<leader>hD", function()
    gitsigns.diffthis("~")
  end)

  m("n", "<leader>hQ", function()
    gitsigns.setqflist("all")
  end)
  m("n", "<leader>hq", gitsigns.setqflist)

  -- Toggles
  m("n", "<leader>tb", gitsigns.toggle_current_line_blame)
  m("n", "<leader>tw", gitsigns.toggle_word_diff)

  -- Text object
  m({ "o", "x" }, "ih", gitsigns.select_hunk)
end
