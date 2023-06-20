-- AUTO INSTALL PACKER IF NOT INSTALLED
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- AUTOCOMMAND THAT RELOADS NEOVIM AND INSTALLS/UPDATES/REMOVES PLUGINS
-- WHEN FILE IS SAVED
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- IMPORT PACKER SAFELY
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- ADD LIST OF PLUGINS TO INSTALL
return packer.startup(function(use)
  -- PACKER CAN MANAGE ITSELF
  use("wbthomason/packer.nvim")

  use("nvim-lua/plenary.nvim") -- LUA FUNCTIONS THAT MANY PLUGINS USE

  use("navarasu/onedark.nvim") -- EDITOR COLORSCHEME

  use("szw/vim-maximizer") -- MAXIMIZES AND RESTORES CURRENT WINDOW

  -- ESSENTIAL PLUGINS
  use("tpope/vim-surround") -- ADD, DELETE, CHANGE SURROUNDINGS (IT'S AWESOME)

  -- COMMENTING WITH GC
  use("numToStr/Comment.nvim")

  -- FILE EXPLORER
  use("nvim-tree/nvim-tree.lua")

  -- VS-CODE LIKE ICONS
  use("nvim-tree/nvim-web-devicons")

  -- STATUSLINE
  use("nvim-lualine/lualine.nvim")

  -- FUZZY FINDING W/ TELESCOPE
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- DEPENDENCY FOR BETTER SORTING PERFORMANCE
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- FUZZY FINDER

  -- AUTOCOMPLETION
  use("hrsh7th/nvim-cmp") -- COMPLETION PLUGIN
  use("hrsh7th/cmp-buffer") -- SOURCE FOR TEXT IN BUFFER
  use("hrsh7th/cmp-path") -- SOURCE FOR FILE SYSTEM PATHS

  -- SNIPPETS
  use("L3MON4D3/LuaSnip") -- SNIPPET ENGINE
  use("saadparwaiz1/cmp_luasnip") -- FOR AUTOCOMPLETION
  use("rafamadriz/friendly-snippets") -- USEFUL SNIPPETS

  -- MANAGING & INSTALLING LSP SERVERS, LINTERS & FORMATTERS
  use("williamboman/mason.nvim") -- IN CHARGE OF MANAGING LSP SERVERS, LINTERS & FORMATTERS
  use("williamboman/mason-lspconfig.nvim") -- BRIDGES GAP B/W MASON & LSPCONFIG

  -- CONFIGURING LSP SERVERS
  use("neovim/nvim-lspconfig") -- EASILY CONFIGURE LANGUAGE SERVERS
  use("hrsh7th/cmp-nvim-lsp") -- FOR AUTOCOMPLETION
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  }) 
  -- ENHANCED LSP UIS
  use("jose-elias-alvarez/typescript.nvim") -- ADDITIONAL FUNCTIONALITY FOR TYPESCRIPT SERVER (E.G. RENAME FILE & UPDATE IMPORTS)
  use("onsails/lspkind.nvim") -- VS-CODE LIKE ICONS FOR AUTOCOMPLETION

  -- FORMATTING & LINTING
  use("jose-elias-alvarez/null-ls.nvim") -- CONFIGURE FORMATTERS & LINTERS
  use("jayp0521/mason-null-ls.nvim") -- BRIDGES GAP B/W MASON & NULL-LS

  -- TREESITTER CONFIGURATION
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  -- AUTO CLOSING
  use("windwp/nvim-autopairs") -- AUTOCLOSE PARENS, BRACKETS, QUOTES, ETC...
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- AUTOCLOSE TAGS

  -- GIT INTEGRATION
  use("lewis6991/gitsigns.nvim") -- SHOW LINE MODIFICATIONS ON LEFT HAND SIDE

  if packer_bootstrap then
    require("packer").sync()
  end
end)
