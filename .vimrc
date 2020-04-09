" Autoload vimrc on save
:autocmd bufwritepost .vimrc source %

:filetype plugin on

" Leader
:let mapleader = "-"
:nnoremap <leader>sv :source $MYVIMRC<cr>
:nnoremap <leader>ev :sp $MYVIMRC<cr>
:nnoremap <leader>q @q

:set foldmethod=indent
:set foldnestmax=1

" Tabs config
:setlocal tabstop=4
:setlocal softtabstop=4
:setlocal shiftwidth=4
:setlocal expandtab
:set autoindent

"-------------------------------
"          Numbers
"--------------------------------
:set number relativenumber
:set nowrap

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Remaps
:imap jj <Esc>

"--------------------------------
"          Appearance
"--------------------------------
" Highligh extra white space.
:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=1
:autocmd InsertLeave * match ExtraWhitespace /\s\+$/

:colo peachpuff

" Hilglight line in normal mode.
:set cul
:autocmd InsertEnter * set nocul
:autocmd InsertLeave * set cul

" Search highlighting
:set incsearch
:nnoremap <silent> <C-l> :nohl<CR><C-l>

" 80 char delimiter
:set colorcolumn=80

" Custom highlights
:hi CursorLine ctermbg=255
:hi ColorColumn ctermbg=255
:hi Folded ctermbg=NONE
