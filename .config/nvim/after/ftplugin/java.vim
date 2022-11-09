" vim:fileencoding=utf-8:ft=vim:foldmethod=marker

" JAVA-VIM {{{1
set ts=4 sts=4 sw=4 et
set bs=indent,eol,start

setlocal makeprg=java\ %\ -g
setlocal errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#

" Autocompletar {{{1

" nnoremap ; $a;<esc>

"Java Support! Should go in compiler/ and ftplugin/
augroup javaSu
    autocmd!
    au FileType java compiler java
    au FileType java noremap <buffer> <leader>8 :make<cr>:copen<cr>
    au FileType java noremap <buffer> <leader>9 :!echo %\|awk -F. '{print $1}'\|xargs java<cr>
augroup end

if executable('rg')
    setlocal grepprg=rg\ --vimgrep
    setlocal grepformat^=%f:%l:%c:%m
endif

noremap <buffer> <leader>8 :make<cr>:copen<cr>
noremap <buffer> <leader>9 :!echo %\|awk -F. '{print $1}'\|xargs java<cr>
