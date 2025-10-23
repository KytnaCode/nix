local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("Formatting", { clear = true })
autocmd("BufWritePost", {
  group = "Formatting",
  command = "FormatWrite",
})

local lint = require("lint")

augroup("Linting", { clear = true })
autocmd("BufWritePost", {
  group = "Linting",
  callback = function()
    lint.try_lint()
  end,
})

-- Use relativenumber on normal and visual mode but no on insert mode.
local function filter()
  if vim.bo.buftype ~= "" then
    return false
  end

  return true
end

local function file_exists(f)
  if vim.uv.fs_stat(f) == nil then
    return false
  end

  return true
end

local function is_buf_empty(bufnr)
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  if #lines == 0 then
    return true
  end

  for _, line in ipairs(lines) do
    if #line > 0 then
      return false
    end
  end

  return true
end

augroup("NumberColumn", { clear = true })
autocmd("ModeChanged", {
  group = "NumberColumn",
  pattern = { "*:n", "*:v" },
  callback = function()
    if not filter() then
      return
    end

    vim.wo.relativenumber = true
  end,
})

autocmd("ModeChanged", {
  group = "NumberColumn",
  pattern = "*:i",
  callback = function()
    if not filter() then
      return
    end

    vim.wo.relativenumber = false
  end,
})

augroup("SessionManagment", { clear = true })
autocmd("VimLeavePre", {
  group = "SessionManagment",
  nested = true,
  callback = function()
    local shouldClose = function(buf)
      if vim.bo[buf].buftype ~= "" then
        return true
      end

      if not file_exists(vim.api.nvim_buf_get_name(buf)) then
        return true
      end

      return false
    end

    local is_session_empty = true

    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      local is_empty = true

      if vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_is_loaded(buf) then
        is_empty = false
      end

      if not is_buf_empty(buf) then
        is_empty = false
      end

      if shouldClose(buf) then
        vim.api.nvim_buf_delete(buf, { force = true })
        is_empty = true
      end

      is_session_empty = is_empty and is_session_empty
    end

    if not is_session_empty then
      require("mini.sessions").write("Session.vim")
    end
  end,
})

-- autocmd("VimEnter", {
--   group = "SessionManagment",
--   nested = true,
--   callback = function()
--     require("mini.sessions").read()
--   end,
-- })
