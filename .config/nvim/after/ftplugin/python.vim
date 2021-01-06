"============================================="
"                PYTHON-VIM                   "
"============================================="


"============================================="
set ts=4 sts=4 sw=4 et
set bs=indent,eol,start

"============================================="

"================= Map-Zone =================="

" Documentacion de referenciat w3schools/Python
nnoremap <buffer> <F1> :w <bar> :!xdg-open https://www.w3schools.com/python/python_reference.asp<Cr><Cr>
" Terminal interactiva
nnoremap <buffer> <F5> :w <bar> :PyREPL<Cr>

"=============== Autocompletar ==============="

inoremap <buffer>( ()<Esc>i
inoremap <buffer>[ []<Esc>i
inoremap <buffer>' ''<Esc>i
inoremap <buffer>" ""<Esc>i
inoremap <buffer>{ {}<Esc>i
inoremap <buffer>{<Cr> {<Cr>}<Esc>O
" inoremap <buffer>< <><Esc>i


" wrap the current line in (), e.g:
" nnoremap (( mMI(<esc>A)<esc>`M

" wrap the rest of the line in ()
nnoremap )) mMi(<esc>A)<esc>`M

" wrap the line so far in ()
nnoremap () mMI(<esc>`Mla)<esc>

nnoremap '' mMi'<esc>A'<esc>`M
nnoremap "  mMI'<esc>`Mla'<esc>
nnoremap <leader>' mMi('<esc>A')<esc>`M

