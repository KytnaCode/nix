local function on_move(data)
  Snacks.rename.on_rename_file(data.source, data.destination)
end

local events = require("neo-tree.events")

require("neo-tree").setup({
  source_selector = { winbar = true },
  event_handlers = {
    { event = events.FILE_MOVED, handler = on_move },
    { event = events.FILE_RENAMED, handler = on_move },
  },
})
