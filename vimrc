call plug#begin()
Plug 'tpope/vim-sensible'

Plug 'kien/ctrlp.vim'
Plug 'JazzCore/ctrlp-cmatcher'
call plug#end()



" ------------------------------------------------------------------------------
" General Settings
" ------------------------------------------------------------------------------
set encoding=utf8

" ------------------------------------------------------------------------------
" White Space
" ------------------------------------------------------------------------------
set tabstop=2                     " Set tab to equal 4 spaces.
set softtabstop=2                 " Set soft tabs equal to 4 spaces.
set shiftwidth=2                  " Set auto indent spacing.
set shiftround                    " Shift to the next round tab stop.
set expandtab                     " Expand tabs into spaces.
set smarttab                      " Insert spaces in front of lines.
set listchars=tab:··,trail:·      " Show leading whitespace
set list

" ------------------------------------------------------------------------------
" Ctrl-p
" ------------------------------------------------------------------------------
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
