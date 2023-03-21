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

  use "nvim-lua/plenary.nvim" -- Required by a bunch of packages but not directly used

  -- Text Editing
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
  --use 'github/copilot.vim'

  -- CMP
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- LSP Config (order of packages is important!!!)
  use "williamboman/mason.nvim" -- LSP client for Mason
  use "williamboman/mason-lspconfig.nvim" -- LSP config for Mason
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use 'jose-elias-alvarez/null-ls.nvim' -- LSP config for null-ls

  use 'sheerun/vim-polyglot' -- Syntax highlighting
end)
