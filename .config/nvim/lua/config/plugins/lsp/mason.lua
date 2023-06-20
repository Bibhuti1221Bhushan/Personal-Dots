-- IMPORT MASON PLUGIN SAFELY
local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

-- IMPORT MASON-LSPCONFIG PLUGIN SAFELY
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

-- IMPORT MASON-NULL-LS PLUGIN SAFELY
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
  return
end

-- ENABLE MASON
mason.setup()

mason_lspconfig.setup({
  -- LIST OF SERVERS FOR MASON TO INSTALL
  ensure_installed = {
    "tsserver",
    "html",
    "cssls",
    "tailwindcss",
    "lua_ls",
    "emmet_ls",
  },
  -- AUTO-INSTALL CONFIGURED SERVERS (WITH LSPCONFIG)
  automatic_installation = true, -- NOT THE SAME AS ENSURE INSTALLED
})

mason_null_ls.setup({
  -- LIST OF FORMATTERS & LINTERS FOR MASON TO INSTALL
  ensure_installed = {
    "prettier", -- TS/JS FORMATTER
    "stylua", -- LUA FORMATTER
    "eslint_d", -- TS/JS LINTER
  },
  -- AUTO-INSTALL CONFIGURED FORMATTERS & LINTERS (WITH NULL-LS)
  automatic_installation = true,
})
