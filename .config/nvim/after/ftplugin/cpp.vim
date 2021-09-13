" vim:fileencoding=utf-8:ft=vim:foldmethod=marker

" CPP-VIM {{{==========================================
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

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
" nnoremap <space>  i<space><esc>
nnoremap <silent><F5> :w <Bar> :CppCMD<Cr>
" nnoremap <silent><F7> :Format <Bar>:w<Cr>
nnoremap <silent><F7>  :call Fermento()<Cr>
"============================================="
" au FileType cpp nnoremap <buffer>K :JbzCppMan()<CR>

function Fermento() abort
    execute ":Format"
    execute ":w"
endfunction

function! s:JbzCppMan()
    let old_isk = &iskeyword
    setl iskeyword+=:
    let str = expand("<cword>")
    let &l:iskeyword = old_isk
    execute 'Man ' . str
endfunction
command! JbzCppMan :call s:JbzCppMan()

" }}}
