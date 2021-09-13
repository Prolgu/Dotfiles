" vim:fileencoding=utf-8:ft=vim:foldmethod=marker

" JAVASCRIPT-VIM {{{=============================================

set ts=2 sts=2 sw=2 
set expandtab tw=120 
set backspace=indent,eol,start

" }}}

" Documentacion w3schools/JavaScript {{{=========================

nnoremap <buffer><silent> <F1> :w <Bar> !xdg-open https://www.w3schools.com/jsref/default.asp<Cr><Cr>
noremap <buffer><silent> <F5> :w! <bar> :JsCMD<Cr>
" }}}

" Autocompletar ==============================

" inoremap <buffer>( ()<Esc>i
" inoremap <buffer>[ []<Esc>i
" inoremap <buffer>' ''<Esc>i
" inoremap <buffer>" ""<Esc>i
" inoremap <buffer>` ``<Esc>i
" inoremap <buffer>{ {}<Esc>i
" inoremap <buffer>{<Cr> {<Cr>}<Esc>O
"inoremap <buffer>< <><Esc>i
"inoremap <buffer>{ {<Cr>}<Esc>O

" add mapping for auto closing
imap <buffer>"<Tab> ""<Left>
imap <buffer>'<Tab> ''<Left>
imap <buffer>(<Tab> ()<Left>
imap <buffer>[<Tab> []<Left>
imap <buffer>{<Tab> {}<Left>
imap <buffer>{<Cr> {<Cr>}<Esc>O<Tab>
" imap <buffer>{;<CR> {<CR>};<ESC>O



" wrap the current line in (), e.g:
" nnoremap (( mMI(<esc>A)<esc>`M

" wrap the rest of the line in ()
nnoremap ) mMi(<esc>A)<esc>`M

" wrap the line so far in ()
nnoremap () mMI(<esc>`Mla)<esc>

nnoremap ( bcw()<Esc>P
nnoremap ' bcw''<Esc>P

nnoremap " mMi'<esc>A'<esc>`M

nnoremap <leader>` mMi`<esc>A`<esc>`M
" nnoremap <leader>' mMi'<esc>A'<esc>`M
nnoremap <leader>z $bi('<esc>eli');<esc>o
" nnoremap <leader><space>  i<space><esc>

nnoremap ; A;<esc>


"============================================="
" In ~/.vim/ftplugin/javascript.vim, or somewhere similar.

" Enable ESLint only for JavaScript.
" let b:ale_linters = ['xo']

" Equivalent to the above.
" let b:ale_linters = {'javascript': ['tsserver']}

"  let g:ale_fixers = {
" \   'javascript': ['prettier'],
" \   'css': ['prettier'],
" \} 

"============================================="
