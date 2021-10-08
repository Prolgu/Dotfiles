" vim:fileencoding=utf-8:ft=vim:foldmethod=marker
" Text.vim configs {{{1 

set nornu
syntax off
" set spelllang=es,cjk
setlocal spell spelllang=en_us
set ts=4 sts=4 sw=4 expandtab
set backspace=indent,eol,start
" set so=999

"********************************************************

"wget http://ftp.vim.org/vim/runtime/spell/es.latin1.spl
"wget http://ftp.vim.org/vim/runtime/spell/es.latin1.sug
"wget http://ftp.vim.org/vim/runtime/spell/es.utf-8.spl
"wget http://ftp.vim.org/vim/runtime/spell/es.utf-8.sug

"========================================================


" Corrector {{{1

nnoremap <silent> <F7> :set spell!<cr>
inoremap <silent> <F7> <C-O>:set spell!<cr>


" inoremap <buffer>~n  

" Especiales {{{1

inoremap <buffer> ~n ñ
inoremap <buffer> 'a á
inoremap <buffer> 'e é
inoremap <buffer> 'i í
inoremap <buffer> 'o ó
inoremap <buffer> 'u ú

" Auto closing {{{1

imap <buffer>"<tab> ""<Left>
imap <buffer>'<tab> ''<Left>
imap <buffer>(<tab> ()<Left>
imap <buffer>[<tab> []<Left>
imap <buffer>{<tab> {}<Left>
" imap <buffer>{<CR> {<CR>}<ESC>O
" imap <buffer>{;<CR> {<CR>};<ESC>O

" wrap the current line in (), e.g:
nnoremap (( mMI(<esc>A)<esc>`M

" wrap the rest of the line in ()
nnoremap )) mMi(<esc>A)<esc>`M

" wrap the line so far in ()
nnoremap () mMI(<esc>`Mla)<esc>

nnoremap "" mMi"<esc>A"<esc>`M
