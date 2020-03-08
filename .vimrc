"--------------------------------
"          Numbers
"--------------------------------
:set number relativenumber
:set nowrap

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

"--------------------------------
"          Appearance
"--------------------------------

:colo koehler
" Hilglight line in normal mode.
:set cul
:autocmd InsertEnter * set nocul
:autocmd InsertLeave * set cul
:hi CursorLine cterm=bold ctermbg=234
" Search highlighting
:set incsearch
nnoremap <silent> <C-l> :nohl<CR><C-l>
