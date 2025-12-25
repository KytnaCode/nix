local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" }, -- For luasnip users.
    { name = "nvim_lsp_signature_help" },
    { name = "nvim_lua" },
    { name = "calc" },
  }, {
    { name = "dotenv" },
    { name = "async_path" },
    { name = "buffer" },
    { name = "tmux" },
  }),
})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "git" },
  }, {
    { name = "buffer" },
    { name = "async_path" },
    { name = "calc" },
    { name = "tmux" },
  }),
})
require("cmp_git").setup()

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "async_path" },
  }, {
    { name = "cmdline" },
  }),
  matching = { disallow_symbol_nonprefix_matching = false },
})

vim.api.nvim_create_autocmd("CmdlineChanged", {
  group = vim.api.nvim_create_augroup("CmpCmdline", {}),
  desc = "enable dotenv completion source when previous character is a dollar sign",
  callback = function()
    local cmd = vim.fn.getcmdline()
    local pos = vim.fn.getcmdpos()

    while pos > 1 and cmd:sub(pos - 1, pos - 1):match("[%w_%$]") ~= nil do
      pos = pos - 1
    end

    local start = string.sub(cmd, pos, pos)
    if start == "$" then
      cmp.complete({
        config = vim.tbl_extend("force", cmp.get_config(), {
          sources = {
            { name = "dotenv" },
          },
        }),
      })
    end
  end,
})
