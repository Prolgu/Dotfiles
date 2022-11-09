"============================================="
"                PYTHON-VIM                   "
"============================================="


"============================================="
set ts=2 sts=2 sw=2 et
set bs=indent,eol,start
" set smartindent
" set so=999
" colorscheme monokai
" colorscheme monokai_pro
" colorscheme monokai_soda
" colorscheme monokai_ristretto
"============================================="

inoremap <buffer> ~n ñ
inoremap <buffer> ~a á
inoremap <buffer> ~e é
inoremap <buffer> ~i í
inoremap <buffer> ~o ó
inoremap <buffer> ~u ú

"================= Map-Zone =================="

" Documentacion de referenciat w3schools/Python
nnoremap <buffer> <F1> :w <bar> :!xdg-open https://www.w3schools.com/python/python_reference.asp<Cr><Cr>
" Terminal interactiva
" nnoremap <buffer> <F5> :w <bar> :PyCMD<Cr>

"=============== Autocompletar ==============="


" wrap the current line in (), e.g:
" nnoremap (( mMI(<esc>A)<esc>`M

" wrap the rest of the line in ()
nnoremap )) mMi(<esc>A)<esc>`M

" wrap the line so far in ()
nnoremap () mMI(<esc>`Mla)<esc>

nnoremap '' mMi'<esc>A'<esc>`M
nnoremap "  mMI'<esc>`Mla'<esc>
nnoremap <leader>' mMi('<esc>A')<esc>`M

