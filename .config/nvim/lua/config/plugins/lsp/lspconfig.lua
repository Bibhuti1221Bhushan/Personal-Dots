-- IMPORT LSPCONFIG PLUGIN SAFELY
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

-- IMPORT CMP-NVIM-LSP PLUGIN SAFELY
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

-- IMPORT TYPESCRIPT PLUGIN SAFELY
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
  return
end

local keymap = vim.keymap -- FOR CONCISENESS

-- ENABLE KEYBINDS ONLY FOR WHEN LSP SERVER AVAILABLE
local on_attach = function(client, bufnr)
  -- KEYBIND OPTIONS
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- SET KEYBINDS
  keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- SHOW DEFINITION, REFERENCES
  keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- GOT TO DECLARATION
  keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- SEE DEFINITION AND MAKE EDITS IN WINDOW
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- GO TO IMPLEMENTATION
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- SEE AVAILABLE CODE ACTIONS
  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- SMART RENAME
  keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- SHOW  DIAGNOSTICS FOR LINE
  keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- SHOW DIAGNOSTICS FOR CURSOR
  keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- JUMP TO PREVIOUS DIAGNOSTIC IN BUFFER
  keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- JUMP TO NEXT DIAGNOSTIC IN BUFFER
  keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- SHOW DOCUMENTATION FOR WHAT IS UNDER CURSOR
  keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- SEE OUTLINE ON RIGHT HAND SIDE

  -- TYPESCRIPT SPECIFIC KEYMAPS (E.G. RENAME FILE AND UPDATE IMPORTS)
  if client.name == "tsserver" then
    keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- RENAME FILE AND UPDATE IMPORTS
    keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- ORGANIZE IMPORTS (NOT IN YOUTUBE NVIM VIDEO)
    keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- REMOVE UNUSED VARIABLES
  end
end

-- USED TO ENABLE AUTOCOMPLETION (ASSIGN TO EVERY LSP SERVER CONFIG)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- CHANGE THE DIAGNOSTIC SYMBOLS IN THE SIGN COLUMN (GUTTER)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- CONFIGURE HTML SERVER
lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- CONFIGURE TYPESCRIPT SERVER WITH PLUGIN
typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
})

-- CONFIGURE CSS SERVER
lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- CONFIGURE TAILWINDCSS SERVER
lspconfig["tailwindcss"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- CONFIGURE EMMET LANGUAGE SERVER
lspconfig["emmet_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

-- CONFIGURE LUA SERVER (WITH SPECIAL SETTINGS)
lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- CUSTOM SETTINGS FOR LUA
    Lua = {
      -- MAKE THE LANGUAGE SERVER RECOGNIZE "VIM" GLOBAL
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- MAKE LANGUAGE SERVER AWARE OF RUNTIME FILES
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})
