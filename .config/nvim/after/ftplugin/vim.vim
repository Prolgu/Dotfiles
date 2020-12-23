
"********************* Tab-indent ***********************"

set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start



nnoremap <F1> :help <C-r><C-w><CR>

inoremap <buffer>( ()<Esc>i
inoremap <buffer>[ []<Esc>i
inoremap <buffer>' ''<Esc>i
inoremap <buffer>" ""<Esc>i
inoremap <buffer>< <><Esc>i

nnoremap <buffer>H :echo expand('<cfile>')<Cr>
