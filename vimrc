call plug#begin()
" General
Plug 'tpope/vim-sensible'

" Text editing
Plug 'ervandew/supertab'
Plug 'tpope/vim-endwise'

"Search and replace
Plug 'kien/ctrlp.vim'
Plug 'JazzCore/ctrlp-cmatcher'

" Linters
Plug 'w0rp/ale'

" Language Support
Plug 'sheerun/vim-polyglot'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'dustinfarris/vim-htmlbars-inline-syntax'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Themes
Plug 'joshdick/onedark.vim'

" Layout
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'

" Testing
Plug 'janko-m/vim-test'
call plug#end()

" ------------------------------------------------------------------------------
" General Settings
" ------------------------------------------------------------------------------
set nocompatible                             " Turn off vi compatibility.
set encoding=utf8

set nobackup                                 " Disable backups.
set nowritebackup
set noswapfile

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" ------------------------------------------------------------------------------
" Text Editing
" ------------------------------------------------------------------------------
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" treat *.thor files as ruby files
au BufNewFile,BufRead *.thor set filetype=ruby

" ------------------------------------------------------------------------------
" White Space
" ------------------------------------------------------------------------------
set tabstop=2                     " Set tab to equal 4 spaces.
set shiftwidth=2                  " Set auto indent spacing.
set shiftround                    " Shift to the next round tab stop.
set expandtab                     " Expand tabs into spaces.

set smarttab                      " Insert spaces in front of lines.
set list listchars=tab:»·,trail:·,nbsp:· " Show leading whitespace
set nojoinspaces                  " Use one space, not two, after punctuation.

" ------------------------------------------------------------------------------
" Ctrl-p
" ------------------------------------------------------------------------------
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

" ------------------------------------------------------------------------------
"  Search and Replace
" ------------------------------------------------------------------------------
set incsearch                     " Show partial matches as search is entered.
set hlsearch                      " Highlight search patterns.
set ignorecase                    " Enable case insensitive search.
set smartcase                     " Disable case insensitivity if mixed case.
set laststatus=2                  " Always display the status line

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" ------------------------------------------------------------------------------
"  Presentation
" ------------------------------------------------------------------------------

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

colorscheme onedark

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" ------------------------------------------------------------------------------
" Linter Config
" ------------------------------------------------------------------------------
let g:ale_sign_column_always = 1

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

" ------------------------------------------------------------------------------
" Testing
" ------------------------------------------------------------------------------
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
