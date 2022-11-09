" vim:fileencoding=utf-8:ft=vim:foldmethod=marker

" RUST-VIM {{{=========================================
set ts=4 sts=4 sw=4 et
set bs=indent,eol,start

nnoremap <silent><F5> :w <Bar> :CargoRun<Cr>
nnoremap <silent><F7> :w <Bar> :CargoCheck<Cr>

nnoremap ; $a;<esc>
nnoremap <leader>fm :RustFmt <Bar> :w<Cr>
