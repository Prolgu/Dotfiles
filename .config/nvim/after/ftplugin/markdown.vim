" vim:fileencoding=utf-8:ft=vim:foldmethod=marker

" MD-VIM  {{{=======================================

set ts=2 sw=2 sts=2
set et
set bs=indent,eol,start
" set so=999
set linebreak
set wrap nolist
setlocal textwidth=80

" }}}


" }}}

" MD-Maps {{{=======================================

nnoremap <silent><buffer> <F7> :set spell!<Cr>
inoremap <silent><buffer> <F7> <C-O>:set spell!<Cr>

nnoremap <silent><buffer> <F5> :w <bar>:ExportAndRun<Cr>
" nnoremap <silent><buffer> <leader>mw :call Mdwrapper()<Cr>

" Especiales {{{====================================

inoremap <buffer> ~n ñ
inoremap <buffer> 'a á
inoremap <buffer> 'e é
inoremap <buffer> 'i í
inoremap <buffer> 'o ó
inoremap <buffer> 'u ú

"}}}

nnoremap (( ciw(<Esc>pa)<Esc>
vnoremap (( c(<Esc>)P<Esc>

let g:markdown_fenced_languages = ['html', 'python', 'lua', 'vim', 'typescript', 'javascript','cpp']

" }}}
