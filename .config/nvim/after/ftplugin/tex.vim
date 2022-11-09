" vim:fileencoding=utf-8:ft=vim:foldmethod=marker
" Text.vim configs {{{1 

" setlocal nornu
" set spelllang=es,cjk
" setlocal spell spelllang=en_us
setlocal spelllang=en_us
set ts=4 sts=4 sw=4 expandtab
set backspace=indent,eol,start
set linebreak
set wrap nolist
setlocal textwidth=80
" set so=999

" colorscheme dracula
"********************************************************

"wget http://ftp.vim.org/vim/runtime/spell/es.latin1.spl
"wget http://ftp.vim.org/vim/runtime/spell/es.latin1.sug
"wget http://ftp.vim.org/vim/runtime/spell/es.utf-8.spl
"wget http://ftp.vim.org/vim/runtime/spell/es.utf-8.sug

"========================================================

nnoremap <silent><buffer> <F5> :w <bar>:ExportAndRun<Cr>

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

