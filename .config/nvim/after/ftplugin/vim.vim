
"============================================="
"                  VIM-VIM                    "
"============================================="


"============================================="

set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start
set fileformat=unix

"============================================="

" syntax match paren1 /[{}]/   
" syntax match paren2 /[()]/   
" syntax match paren3 /[<>]/   
                        
" hi paren1 guifg=#0087FF 
" hi paren2 guifg=#FF00FF 
" hi paren3 guifg=#00FF5F 
" autocmd! VimEnter,BufWinEnter * syn match parens /[{}]/ | hi parens ctermfg=cyan
hi MatchParen ctermbg=blue guibg=lightblue
"================ Mapping  ==================="

nnoremap <F1> :help <C-r><C-w><CR>

inoremap <buffer>( ()<Esc>i
inoremap <buffer>[ []<Esc>i
inoremap <buffer>' ''<Esc>i
inoremap <buffer>" ""<Esc>i
inoremap <buffer>< <><Esc>i

" nnoremap <buffer>H :echo expand('<cfile>')<Cr>

"============================================="
