" vim:fileencoding=utf-8:ft=vim:foldmethod=marker

" JAVASCRIPT-VIM {{{=============================================
set ts=4 sts=4 sw=4
set expandtab tw=120
set backspace=indent,eol,start
" }}}

" Documentacion w3schools/JavaScript {{{=========================
" nnoremap <buffer><silent> <F1> :w <Bar> !xdg-open https://www.w3schools.com/jsref/default.asp<Cr><Cr>
nnoremap <buffer><silent> <F1> :w <Bar> :AsyncRun firefox https://www.w3schools.com/jsref/default.asp<Cr>
noremap <buffer><silent> <F5> :w! <Bar> :JsCMD<Cr>
vnoremap <buffer><silent> <F5> :'<,'>w !node <Cr>

" }}}

" Autocompletar ==============================

" wrap the current line in (), e.g:
" nnoremap (( mMI(<esc>A)<esc>`M

" wrap the rest of the line in ()
nnoremap ) mMi(<esc>A)<esc>`M

" wrap the line so far in ()
nnoremap () mMI(<Esc>`Mla)<esc>

nnoremap ( bcw()<Esc>P
nnoremap ' bcw''<Esc>P

nnoremap " mMi"<esc>A"<esc>`M

nnoremap <leader>` mMi`<esc>A`<esc>`M
" nnoremap <leader>' mMi'<esc>A'<esc>`M
" nnoremap <leader>z $bi('<esc>eli')<esc>o
" nnoremap <leader><space>  i<space><esc>

nnoremap ; A;<esc>

" Escritura ===================================
inoremap <buffer> ~n ñ
inoremap <buffer> ~a á
inoremap <buffer> ~e é
inoremap <buffer> ~i í
inoremap <buffer> ~o ó
inoremap <buffer> ~u ú

" nnoremap <leader>; :%s/;$//<Bar> :noh<Cr>

" =============================================
" In ~/.vim/ftplugin/javascript.vim, or somewhere similar.

" Enable ESLint only for JavaScript.
" let b:ale_linters = ['xo']

" Equivalent to the above.
" let b:ale_linters = {'javascript': ['tsserver']}

"  let g:ale_fixers = {
" \   'javascript': ['prettier'],
" \   'css': ['prettier'],
" \}
" =============================================
