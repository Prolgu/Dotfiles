
"============================================="
"                 HTML-VIM                    "
"============================================="

set ts=2 sw=2 sts=2 
set et tw=120
set bs=indent,eol,start

"============================================="
"************** HTML- Maps *******************"
"============================================="

nnoremap gf :call Salt()<Cr>
nnoremap gr :call JumpToCSS()<Cr><Cr>

inoremap <buffer> > ></<C-x><C-o><C-y><C-o>%<C-o>i
nnoremap <buffer> <leader>6 :r ~/.vimtemplates/ipsum.template<Cr>

" Documentacion de referencias w3schools/html
nnoremap <buffer> <F1> :w <Bar> !xdg-open https://www.w3schools.com/tags/default.asp<Cr><Cr>
"nnoremap <buffer> <silent> <F5> :call BrowserPreview()<CR>
nnoremap <buffer> <F5> :w <Bar> !xdg-open %<Cr><Cr>
inoremap <buffer> <leader>b <br/>

inoremap <buffer>" ""<Esc>i

