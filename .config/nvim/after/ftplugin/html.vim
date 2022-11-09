" vim:fileencoding=utf-8:ft=vim:foldmethod=marker

" HTML-VIM  {{{===========================================
set ts=2 sw=2 sts=2
set et tw=120
set bs=indent,eol,start
set nolist
" autocmd BufNewFile,BufRead *.html set filetype=html

" if &ft=="markdown"
"   finish
" endif

" }}}

" HTML-Maps {{{===========================================

inoremap <buffer> ~n ñ
inoremap <buffer> 'a á
inoremap <buffer> 'e é
inoremap <buffer> 'i í
inoremap <buffer> 'o ó
inoremap <buffer> 'u ú


nnoremap <silent> gf :call Salt()<Cr>

" nnoremap <silent> gr :call JumpToCSS()<Cr><Cr>

" inoremap <buffer> > ></<C-x><C-o><C-y><C-o>%<C-o>i
" nnoremap <buffer> <leader>6 :r ~/.vimtemplates/ipsum.template<Cr>

" Documentacion de referencias w3schools/html
nnoremap <silent><buffer> <F1> :w <Bar> !xdg-open https://www.w3schools.com/tags/default.asp<Cr><Cr>
"nnoremap <buffer> <silent> <F5> :call BrowserPreview()<CR>
" nnoremap <silent><buffer> <F5> :w <Bar> !xdg-open %<Cr><Cr>
nnoremap <silent><buffer> <F5> :w <Bar> :AsyncRun firefox %<Cr>
" inoremap <silent><buffer> <leader>b <br/>
" nnoremap <silent><buffer> <F6> :w <Bar> !live-server  %:p:h<Cr><Cr>
" nnoremap <silent><buffer> <F5> :w <Bar> !live-server --browser=luakit %:p:h<Cr><Cr>
" nnoremap <silent><buffer> <F5> :Bracey<Cr>
" inoremap <silent><buffer>" ""<Esc>i

" }}}
