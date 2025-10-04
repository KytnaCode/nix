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

    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if shouldClose(buf) then
        vim.api.nvim_buf_delete(buf, { force = true })
      end
    end

    require("mini.sessions").write("Session.vim")
  end,
})

-- autocmd("VimEnter", {
--   group = "SessionManagment",
--   nested = true,
--   callback = function()
--     require("mini.sessions").read()
--   end,
-- })
