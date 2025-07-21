vim.g.coq_settings = {
  auto_start = "shut-up",
  ["clients.lsp"] = {
    always_on_top = {},
    resolve_timeout = 0.1,
  },
}

local enable_nvim_lua = os.getenv("ENABLE_NVIM_API")

local sources = {
  { src = "bc", short_name = "MATH", precision = 6 },
}

if enable_nvim_lua then
  table.insert(sources, { src = "nvimlua", short_name = "nLUA", conf_only = false })
end

require("coq_3p")(sources)
