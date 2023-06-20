-- IMPORT NVIM-CMP PLUGIN SAFELY
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

-- IMPORT LUASNIP PLUGIN SAFELY
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
  return
end

-- IMPORT LSPKIND PLUGIN SAFELY
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
  return
end

-- LOAD VS-CODE LIKE SNIPPETS FROM PLUGINS (E.G. FRIENDLY-SNIPPETS)
require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    documentation = false
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- PREVIOUS SUGGESTION
    ["<C-j>"] = cmp.mapping.select_next_item(), -- NEXT SUGGESTION
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(), -- SHOW COMPLETION SUGGESTIONS
    ["<C-e>"] = cmp.mapping.abort(), -- CLOSE COMPLETION WINDOW
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  }),
  -- SOURCES FOR AUTOCOMPLETION
  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- LSP
    { name = "luasnip" }, -- SNIPPETS
    { name = "buffer" }, -- TEXT WITHIN CURRENT BUFFER
    { name = "path" }, -- FILE SYSTEM PATHS
  }),
  -- CONFIGURE LSPKIND FOR VS-CODE LIKE ICONS
  formatting = {
    format = lspkind.cmp_format({
      maxwidth = 50,
      ellipsis_char = "...",
    }),
  },
})
