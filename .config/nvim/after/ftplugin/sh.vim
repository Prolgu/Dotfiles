"  SHELL-VIM  ================================"
set ts=4 sts=4 sw=4 
set expandtab tw=120 
set backspace=indent,eol,start
" set so=999

nnoremap <buffer><silent> <F5> :w! <bar>:ShCMD<Cr>

" add mapping for auto closing
imap <buffer>"<tab> ""<Left>
imap <buffer>'<tab> ''<Left>
imap <buffer>(<tab> ()<Left>
imap <buffer>[<tab> []<Left>
imap <buffer>{<tab> {}<Left>
imap <buffer>{<CR> {<CR>}<ESC>O
" imap <buffer>{;<CR> {<CR>};<ESC>O


"============================================="
"============================================="
