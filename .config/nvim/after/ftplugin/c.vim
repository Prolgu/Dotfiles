
"============================================="
set ts=4 sts=4 sw=4 et
set bs=indent,eol,start
" }}}

" Autocompletar {{{====================================

inoremap <buffer>( ()<Esc>i
inoremap <buffer>[ []<Esc>i
inoremap <buffer>' ''<Esc>i
inoremap <buffer>" ""<Esc>i
" inoremap <buffer>{ {}<Esc>i
inoremap <buffer>{ {<Cr>}<Esc>O

nnoremap <leader>z $bi('<esc>eli');<esc>o
nnoremap ; $a;<esc>

nnoremap <silent><F5> :w <bar> :CREPL<Cr>
