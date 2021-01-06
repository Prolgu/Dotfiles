"============================================="
"                  CPP-VIM                    "
"============================================="
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1




"============================================="
set ts=4 sts=4 sw=4 et
set bs=indent,eol,start

"============================================="

"=============== Autocompletar ==============="

inoremap <buffer>( ()<Esc>i
inoremap <buffer>[ []<Esc>i
inoremap <buffer>' ''<Esc>i
inoremap <buffer>" ""<Esc>i
" inoremap <buffer>{ {}<Esc>i
inoremap <buffer>{ {<Cr>}<Esc>O

nnoremap <leader>z $bi('<esc>eli');<esc>o
nnoremap ; $a;<esc>
nnoremap <space>  i<space><esc>

"============================================="
