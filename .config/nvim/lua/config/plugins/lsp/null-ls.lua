-- IMPORT NULL-LS PLUGIN SAFELY
local setup, null_ls = pcall(require, "null-ls")
if not setup then
  return
end

-- FOR CONCISENESS
local formatting = null_ls.builtins.formatting -- TO SETUP FORMATTERS
local diagnostics = null_ls.builtins.diagnostics -- TO SETUP LINTERS

-- TO SETUP FORMAT ON SAVE
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- CONFIGURE NULL_LS
null_ls.setup({
  -- SETUP FORMATTERS & LINTERS
  sources = {
    --  TO DISABLE FILE TYPES USE
    formatting.prettier, -- JS/TS FORMATTER
    formatting.stylua, -- LUA FORMATTER
    diagnostics.eslint_d.with({ -- JS/TS LINTER
      -- ONLY ENABLE ESLINT IF ROOT HAS .ESLINTRC.JS
      condition = function(utils)
        return utils.root_has_file(".eslintrc.js") -- CHANGE FILE EXTENSION IF YOU USE SOMETHING ELSE
      end,
    }),
  },
  -- CONFIGURE FORMAT ON SAVE
  on_attach = function(current_client, bufnr)
    if current_client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            filter = function(client)
              --  ONLY USE NULL-LS FOR FORMATTING INSTEAD OF LSP SERVER
              return client.name == "null-ls"
            end,
            bufnr = bufnr,
          })
        end,
      })
    end
  end,
})
