call plug#begin()
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'

" General
Plug 'tpope/vim-sensible'

" Text editing
Plug 'ervandew/supertab'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'raimondi/delimitmate'

"Search and replace
Plug 'kien/ctrlp.vim'
Plug 'JazzCore/ctrlp-cmatcher'

" Linters
Plug 'w0rp/ale'

" Language Support
Plug 'sheerun/vim-polyglot'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

" Themes
Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline-themes'

" Layout
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'justincampbell/vim-eighties' " sensible buffer resizing

" Testing
Plug 'janko-m/vim-test'

" File editing
Plug 'pbrisbin/vim-mkdir'
Plug 'henrik/rename.vim'
call plug#end()

" ------------------------------------------------------------------------------
" General Settings
" ------------------------------------------------------------------------------
let mapleader = ","

set encoding=utf8

set nobackup                                 " Disable backups.
set nowritebackup
set noswapfile

set spelllang=en_gb
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.markdown setlocal spell
set complete+=kspell

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Move to previous buffer with ,,
nnoremap <leader><leader> <C-^>

" ------------------------------------------------------------------------------
" Text Editing
" ------------------------------------------------------------------------------
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" ------------------------------------------------------------------------------
" White Space
" ------------------------------------------------------------------------------
set tabstop=2                     " Set tab to equal 4 spaces.
set softtabstop=2                 " Set soft tabs equal to 4 spaces.
set shiftwidth=2                  " Set auto indent spacing.
set shiftround                    " Shift to the next round tab stop.
set expandtab                     " Expand tabs into spaces.

set nojoinspaces                  " Use one space, not two, after punctuation.

" ------------------------------------------------------------------------------
" Ctrl-p
" ------------------------------------------------------------------------------
let g:ctrlp_user_command = "ag %s -l --nocolor -g ''"
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

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

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number

" Quit vim if NERDTree is last window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ------------------------------------------------------------------------------
" Linter Config
" ------------------------------------------------------------------------------
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

" ------------------------------------------------------------------------------
" Testing
" ------------------------------------------------------------------------------
let test#strategy = "neovim" " https://github.com/janko-m/vim-test#strategies

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" ------------------------------------------------------------------------------
" Functions
" ------------------------------------------------------------------------------

" Strip Trailing Whitespace
function! StripTrailingWhitespace()
    if !&binary && &modifiable && &filetype != "diff"
        let l:winview = winsaveview()
        %s/\s\+$//e
        let @/=""
        call winrestview(l:winview)
    endif
endfunction
nnoremap <leader>W :call StripTrailingWhitespace()<CR>


" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
