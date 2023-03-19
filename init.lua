require('plugins')
require('language_server_config')


-- ----------------------------------------------------------------------------
-- General Settings
-- ----------------------------------------------------------------------------

-- Set leader key
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Quicker navigation between splits
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')


-- Move to previous buffer with gb
vim.keymap.set('n', 'gb', '<C-^>')

-- NERDTree

vim.keymap.set('n', '<Leader>nt', ':NERDTreeToggle<CR>')
vim.keymap.set('n', '<Leader>nf', ':NERDTreeFind<CR>')

vim.opt.clipboard = 'unnamedplus' -- Copy to system clipboard

vim.cmd([[
set nobackup                                 " Disable backups.
set nowritebackup
set noswapfile
]])

-- ----------------------------------------------------------------------------
-- Spell Checking
-- ----------------------------------------------------------------------------
vim.cmd([[
set spelllang=en_gb,en_us

augroup customSpellChecking
  autocmd!
  autocmd FileType markdown setlocal spell
  autocmd FileType gitcommit setlocal spell
  autocmd FileType text setlocal spell
augroup END

set complete+=kspell
]])

-- ----------------------------------------------------------------------------
-- White Space
-- ----------------------------------------------------------------------------
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
--vim.opt.nojoinspaces = true

vim.cmd([[
  set list listchars=tab:»·,trail:·,nbsp:· " Show trailing whitespace
]])


-- ----------------------------------------------------------------------------
-- Search and Replace
-- ----------------------------------------------------------------------------
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- ----------------------------------------------------------------------------
--  Ag/grep
-- ----------------------------------------------------------------------------

vim.cmd([[
if executable('ag')
  " If ag is available, we should use it because it's much faster than grep!
  let g:ctrlp_user_command = "ag %s -l --nocolor -g ''"

  set grepprg=ag\ --nogroup\ --nocolor

  " bind \ (backward slash) to grep shortcut
  command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap \ :Ag<SPACE>
endif

" bind F to grep word under cursor
" nnoremap F :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
]])

-- ----------------------------------------------------------------------------
--  Status Line
-- ----------------------------------------------------------------------------
vim.opt.laststatus = 2 -- Always display the status line

-- ----------------------------------------------------------------------------
--  Presentation
-- ----------------------------------------------------------------------------
vim.opt.number = true -- Show line numbers
vim.cmd("colorscheme jellybeans") -- Set color scheme
--vim.g.airline_section_y = "" -- Remove file encoding from status line

-- Use powerline fonts. For this to work the iTerm setting "Use built-in
-- Powerline glyphs" must be enabled. See this SO answer for more info:
-- https://apple.stackexchange.com/a/413332/223301
vim.g.airline_powerline_fonts = 1

-- ----------------------------------------------------------------------------
--  Line Length
-- ---------------------------------------------------------------------------- vim.opt.textwidth = 80 -- Set line length to 80 characters vim.opt.colorcolumn = '80' -- Show line length in the editor

vim.cmd([[
augroup setPythonTextOptions
  autocmd!
  " The Black Python code formatter uses 88 as its default line-length.
  autocmd FileType python setlocal textwidth=88

  " Disable 'Auto-wrap text using textwidth' because python is whitespace aware
  autocmd FileType python setlocal formatoptions-=t
augroup END
]])

-- ----------------------------------------------------------------------------
-- Testing
-- ----------------------------------------------------------------------------
vim.cmd([[
" Use "neovim" test strategy and remap <C-\><C-n> to <C-o> to " allow you to
" enter normal mode easier and scroll through test output.
let test#strategy = "neovim"
tmap <C-o> <C-\><C-n>

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
]])
