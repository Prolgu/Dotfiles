" vim:ft=vim:fileencoding=utf-8
" Settings {{{1
set ts=4 sts=4 sw=4 et
set bs=indent,eol,start
" set so=999

" Autocompletar {{{1


imap <buffer>"<tab> ""<Left>
imap <buffer>'<tab> ''<Left>
imap <buffer>(<tab> ()<Left>
imap <buffer>[<tab> []<Left>
imap <buffer>{<tab> {}<Left>
imap <buffer>{<CR> {<CR>}<ESC>O<Tab>
" imap <buffer>{;<CR> {<CR>};<ESC>O

nnoremap <leader>z $bi('<esc>eli');<esc>o
nnoremap ; $a;<esc>

nnoremap <silent><F5> :w <bar> :CREPL<Cr>
