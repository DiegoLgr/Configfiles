" Autoload vimrc on save
:autocmd bufwritepost .vimrc source %

:filetype plugin on

:set foldmethod=indent
:set foldnestmax=1
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

:colo koehler

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
:hi CursorLine cterm=bold ctermbg=234
:hi ColorColumn ctermbg=235
:hi Folded ctermbg=NONE
