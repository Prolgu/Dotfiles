" vim:fileencoding=utf-8:ft=vim:foldmethod=marker

" CSS-VIM  {{{=============================================

" set filetype=css
" setlocal iskeyword+=-

set tabstop=2 sts=2 sw=2 tw=120 


" Documentacion de referencias w3schools/css
inoremap <buffer> <F1> :w <bar> :!xdg-open https://www.w3schools.com/cssref/default.asp<Cr><Cr>
inoremap <buffer>{ {<Cr>}<Esc>O<Tab>
" }}}
