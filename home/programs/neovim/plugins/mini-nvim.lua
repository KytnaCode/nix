-- 'a' and 'i' text objects.
require("mini.ai").setup()

-- Comment chunks of code
require("mini.comment").setup()

-- Move chunks of code.
require("mini.move").setup()

-- More text operators.
require("mini.operators").setup()

-- Autopairs.
require("mini.pairs").setup()

-- Split or join function arguments.
require("mini.splitjoin").setup()

-- Sessions

require("mini.sessions").setup()

-- Sorround text actions.
require("mini.surround").setup()

-- Keymaps clues.
local miniclue = require("mini.clue")

miniclue.setup({
  triggers = {
    -- Leader
    { mode = "n", keys = "<leader>" },
    { mode = "v", keys = "<leader>" },

    -- G key
    { mode = "n", keys = "g" },
    { mode = "x", keys = "x" },

    -- Marks
    { mode = "n", keys = "'" },
    { mode = "n", keys = "`" },
    { mode = "x", keys = "'" },
    { mode = "x", keys = "`" },

    -- Registers
    { mode = "n", keys = '"' },
    { mode = "x", keys = '"' },
    { mode = "i", keys = "<C-r>" },
    { mode = "c", keys = "<C-r>" },
  },

  clues = {
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
  },
})

-- Highlight word under cursor.
require("mini.cursorword").setup()
