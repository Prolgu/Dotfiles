
"============================================="
"*********************************************"
"                 HTML-VIM                    "
"*********************************************"
"============================================="

 set tabstop=2 
 set softtabstop=2 
 set shiftwidth=2 
 set textwidth=120 
 set fileformat=unix 




"============================================="
"************** HTML- Maps *******************"
"============================================="

nnoremap gf :call Salt()<Cr>
nnoremap gr :call JumpToCSS()<Cr><Cr>

inoremap <buffer> > ></<C-x><C-o><C-y><C-o>%<C-o>i
nnoremap <buffer> <leader>6 :r ~/.vimtemplates/ipsum.template<Cr>

"nnoremap <buffer> <silent> <F5> :call BrowserPreview()<CR>
nnoremap <buffer> <F5> :w <Bar> !xdg-open %<CR>
inoremap <buffer> <leader>b <br/>

inoremap <buffer>" ""<Esc>i

