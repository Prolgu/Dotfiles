set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start

function! Termy() abort
  call FloatermNew --autoclose=0 python %    
endfunction


"********* Map-Zone ***********"

nnoremap <buffer> <F5> :w <bar> :PyREPL<Cr>
" nnoremap <buffer> <F5> :FloatermNew python %<Cr>

"******** Autocompletar *******"

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

