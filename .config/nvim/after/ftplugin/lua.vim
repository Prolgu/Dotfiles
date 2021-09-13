
"============================================="
"                  LUA-VIM                    "
"============================================="


"============================================="
 
set tabstop=2 softtabstop=2 
set shiftwidth=2 
set textwidth=120 
set expandtab
set backspace=indent,eol,start
set fileformat=unix 

"============================================="


inoremap <buffer>( ()<Esc>i
inoremap <buffer>[ []<Esc>i
inoremap <buffer>' ''<Esc>i
inoremap <buffer>" ""<Esc>i
inoremap <buffer>{ {}<Esc>i

nnoremap <buffer> <F5> :w <bar> :LuaCMD<Cr>

nnoremap " mMi"<esc>A"<esc>`M

