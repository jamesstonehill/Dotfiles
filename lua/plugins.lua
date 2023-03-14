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

vim.cmd [[packadd packer.nvim]]

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Text Editing
  use 'ervandew/supertab'
  use 'tpope/vim-endwise'
  use 'tpope/vim-surround'
  use 'scrooloose/nerdcommenter'
  --use 'raimondi/delimitmate'

  -- Search and replace
  use 'ctrlpvim/ctrlp.vim'
  use 'google/vim-searchindex'

  -- Git
  use 'tpope/vim-fugitive' -- Git integration
  use 'shumphrey/fugitive-gitlab.vim' -- GitLab integration for fugitive
  use 'tpope/vim-rhubarb' -- Open GitHub/GitLab URLs in browser
  use 'airblade/vim-gitgutter' -- Show git diff in gutter

  -- Themes
  use 'nanotech/jellybeans.vim'
  --use 'vim-airline/vim-airline-themes'

  -- Layout
  use 'vim-airline/vim-airline'
  use 'justincampbell/vim-eighties' -- sensible buffer resizing
  use 'scrooloose/nerdtree'

  -- Testing
  use 'janko-m/vim-test'

  -- File editing
  use 'pbrisbin/vim-mkdir'
  use 'henrik/rename.vim'

  -- Code Completion
  use 'github/copilot.vim'
end)
