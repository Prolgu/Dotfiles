" vim:fileencoding=utf-8:ft=vim:foldmethod=marker

" SCSS-VIM  {{{=============================================

" autocmd FileType scss setl iskeyword+=@-@
set tabstop=2 sts=2 sw=2 tw=120 
set so=999
setl iskeyword+=@-@
nnoremap <silent><buffer> <F5> :w <Bar>:!sass % %:r.css<Cr>
