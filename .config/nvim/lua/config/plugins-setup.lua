-- PACKER BOOTSTRAP SETUP
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- AUTOCOMMAND THAT RELOADS NEOVIM AND INSTALLS/UPDATES/REMOVES PLUGINS
-- WHEN FILE IS SAVED
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- IMPORT PACKER SAFELY

return require('packer').startup(function(use)
  use {"wbthomason/packer.nvim"}
  -- PLUGINS START

  -- STATUS LINE
  use {"nvim-lualine/lualine.nvim"}

  -- EDITOR COLOR-SCHEME
  use {"catppuccin/nvim"} 

  -- PLUGINS END
  if packer_bootstrap then
    require('packer').sync()
  end
end)