call plug#begin('~/Dotfiles/plugged')
" General
Plug 'tpope/vim-sensible'

" Text editing
Plug 'ervandew/supertab'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'raimondi/delimitmate'

"Search and replace
Plug 'ctrlpvim/ctrlp.vim'
Plug 'google/vim-searchindex'

" Linters
Plug 'w0rp/ale'
Plug 'jparise/vim-graphql'

" Language Support
Plug 'sheerun/vim-polyglot'

" Git
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

" Themes
Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline-themes'

" Layout
Plug 'vim-airline/vim-airline'
Plug 'justincampbell/vim-eighties' " sensible buffer resizing
Plug 'scrooloose/nerdtree'

" Testing
Plug 'janko-m/vim-test'

" File editing
Plug 'pbrisbin/vim-mkdir'
Plug 'henrik/rename.vim'

" Ruby Stuff
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
call plug#end()

" ------------------------------------------------------------------------------
" General Settings
" ------------------------------------------------------------------------------
set nocompatible                             " Disable Vi comptability

let mapleader = ","

set encoding=utf8

set nobackup                                 " Disable backups.
set nowritebackup
set noswapfile

set updatetime=500                           " Refresh vim-gitgutter more often
set clipboard+=unnamedplus                   " Copy into system clipboard

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Move to previous buffer with gb
nnoremap gb <C-^>

" NERDTree
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ------------------------------------------------------------------------------
" Text Editing
" ------------------------------------------------------------------------------
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" ------------------------------------------------------------------------------
" Spell Checking
" ------------------------------------------------------------------------------
set spelllang=en_gb,en_us

augroup customSpellChecking
  autocmd!
  autocmd FileType markdown setlocal spell
  autocmd FileType gitcommit setlocal spell
augroup END

set complete+=kspell

" ------------------------------------------------------------------------------
" White Space
" ------------------------------------------------------------------------------
set tabstop=2                     " Set tab to equal 4 spaces.
set softtabstop=2                 " Set soft tabs equal to 4 spaces.
set shiftwidth=2                  " Set auto indent spacing.
set shiftround                    " Shift to the next round tab stop.
set expandtab                     " Expand tabs into spaces.
set list listchars=tab:»·,trail:·,nbsp:· " Show leading whitespace

set nojoinspaces                  " Use one space, not two, after punctuation.

" ------------------------------------------------------------------------------
" Ctrl-p
" ------------------------------------------------------------------------------
let g:ctrlp_user_command = "ag %s -l --nocolor -g ''"

" ------------------------------------------------------------------------------
"  Search and Replace
" ------------------------------------------------------------------------------
set hlsearch                      " Highlight search patterns.
set ignorecase                    " Enable case insensitive search.
set smartcase                     " Disable case insensitivity if mixed case.

" ------------------------------------------------------------------------------
"  Ag/grep
" ------------------------------------------------------------------------------
set grepprg=ag\ --nogroup\ --nocolor

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" ------------------------------------------------------------------------------
"  Status Line
" ------------------------------------------------------------------------------
set laststatus=2                  " Always display the status line

" ------------------------------------------------------------------------------
"  Presentation
" ------------------------------------------------------------------------------
colorscheme jellybeans
let g:airline_theme='jellybeans'

" Numbers
set number

" ------------------------------------------------------------------------------
"  Line Length
" ------------------------------------------------------------------------------
set textwidth=80
set colorcolumn=+1

augroup setPythonTextWidth
  autocmd!
  " The Black Python code formatter uses 88 as its default line-length.
  autocmd FileType python setlocal textwidth=88
augroup END

" ------------------------------------------------------------------------------
" Linter Config
" ------------------------------------------------------------------------------
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

nnoremap <leader>f :ALEFix<CR>

let g:ale_fixers = {
\    '*': ['remove_trailing_lines', 'trim_whitespace'],
\    'ruby': ['rubocop'],
\    'elixir': ['mix_format'],
\    'javascript': ['prettier'],
\    'python': ['black'],
\    'markdown': ['prettier']
\ }

" ------------------------------------------------------------------------------
" Testing
" ------------------------------------------------------------------------------

" When using neovim use "neovim" test strategy and remap <C-\><C-n> to <C-o> to
" allow you to enter normal mode easier and scroll through test output.
if has('nvim')
  let test#strategy = "neovim"
  tmap <C-o> <C-\><C-n>
end

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
