"********************************************************
"********************************************************
"********************************************************
"********************************************************

set nornu
syntax off
set spelllang=es,cjk

set ts=4 sts=4 sw=4 expandtab
set backspace=indent,eol,start

"********************************************************

"wget http://ftp.vim.org/vim/runtime/spell/es.latin1.spl
"wget http://ftp.vim.org/vim/runtime/spell/es.latin1.sug
"wget http://ftp.vim.org/vim/runtime/spell/es.utf-8.spl
"wget http://ftp.vim.org/vim/runtime/spell/es.utf-8.sug
"

"********************************************************


"********************* Corrector  **********************"
"
nnoremap <silent> <F7> :set spell!<cr>
inoremap <silent> <F7> <C-O>:set spell!<cr>

inoremap <buffer>~n  ñ
inoremap <buffer>( ()<Esc>i
inoremap <buffer>[ []<Esc>i
inoremap <buffer>' ''<Esc>i
inoremap <buffer>" ""<Esc>i

" wrap the current line in (), e.g:
nnoremap (( mMI(<esc>A)<esc>`M

" wrap the rest of the line in ()
nnoremap )) mMi(<esc>A)<esc>`M

" wrap the line so far in ()
nnoremap () mMI(<esc>`Mla)<esc>


nnoremap "" mMi"<esc>A"<esc>`M
