" vim:fileencoding=utf-8:ft=vim:foldmethod=marker

" JAVA-VIM {{{1
set ts=4 sts=4 sw=4 et
set bs=indent,eol,start

" Autocompletar {{{1

inoremap <buffer>( ()<Esc>i
inoremap <buffer>[ []<Esc>i
inoremap <buffer>' ''<Esc>i
inoremap <buffer>" ""<Esc>i
" inoremap <buffer>{ {}<Esc>i
inoremap <buffer>{ {<Cr>}<Esc>O

nnoremap ; $a;<esc>

"Java Support! Should go in compiler/ and ftplugin/
augroup javaSu
    autocmd!
    autocmd FileType java compiler javac
    au Filetype java setlocal makeprg=javac\ %\ -g
    au Filetype java setlocal errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
    au FileType java noremap <buffer> <leader>8 :make<cr>:copen<cr>
    au FileType java noremap <buffer> <leader>9 :!echo %\|awk -F. '{print $1}'\|xargs java<cr>
augroup end

if executable('rg')
    set grepprg=rg\ --vimgrep
    set grepformat^=%f:%l:%c:%m
endif
