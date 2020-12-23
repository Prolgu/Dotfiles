
"============================================="
"*********************************************"
"              JAVASCRIPT-VIM                 "
"*********************************************"
"============================================="

 set tabstop=2 
 set softtabstop=2 
 set shiftwidth=2 
 set textwidth=120 
 set fileformat=unix 

" In ~/.vim/ftplugin/javascript.vim, or somewhere similar.

" Enable ESLint only for JavaScript.
" let b:ale_linters = ['xo']

" Equivalent to the above.
let b:ale_linters = {'javascript': ['tsserver']}

 let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\} 

"********* Map-Zone ***********"

noremap <buffer> <F5> :w! <bar> :JSREPL<Cr>

"******** Autocompletar *******"

inoremap <buffer>( ()<Esc>i
inoremap <buffer>[ []<Esc>i
inoremap <buffer>' ''<Esc>i
inoremap <buffer>" ""<Esc>i
inoremap <buffer>` ``<Esc>i
inoremap <buffer>{ {}<Esc>i
inoremap <buffer>{<Cr> {<Cr>}<Esc>O
"inoremap <buffer>< <><Esc>i
"inoremap <buffer>{ {<Cr>}<Esc>O

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
nnoremap <space>  i<space><esc>

nnoremap ; $a;<esc>


