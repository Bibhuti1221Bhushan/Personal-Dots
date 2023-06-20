-- IMPORT NVIM-TREESITTER PLUGIN SAFELY
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

-- CONFIGURE TREESITTER
treesitter.setup({
  -- ENABLE SYNTAX HIGHLIGHTING
  highlight = {
    enable = true,
  },
  -- ENABLE INDENTATION
  indent = { enable = true },
  -- ENABLE AUTOTAGGING (W/ NVIM-TS-AUTOTAG PLUGIN)
  autotag = { enable = true },
  -- ENSURE THESE LANGUAGE PARSERS ARE INSTALLED
  ensure_installed = {
    "json",
    "javascript",
    "typescript",
    "tsx",
    "yaml",
    "html",
    "css",
    "markdown",
    "markdown_inline",
    "svelte",
    "graphql",
    "bash",
    "lua",
    "vim",
    "dockerfile",
    "gitignore",
  },
  -- AUTO INSTALL ABOVE LANGUAGE PARSERS
  auto_install = true,
})
