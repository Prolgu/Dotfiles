"============================================="
"              JAVASCRIPT-VIM                 "
"============================================="

" lua <<EOF
"   local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
"   local g = vim.g      -- a table to access global variables
"   local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
"   local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')

"   local function opt(scope, key, value)
"     scopes[scope][key] = value
"     if scope ~= 'o' then scopes['o'][key] = value end
"   end

"   opt('b','expandtab',true)
"   opt('b','tabstop', 2)
"   opt('b','softtabstop',2)
"   opt('b','shiftwidth',2)
"   opt('b','textwidth',120)

" EOF

 set ts=2 sts=2 sw=2 
 set expandtab tw=120 
 set backspace=indent,eol,start
"============================================="

" Documentacion de referencias w3schools/JavaScript
nnoremap <buffer> <F1> :w <Bar> !xdg-open https://www.w3schools.com/jsref/default.asp<Cr><Cr>
noremap <buffer> <F5> :w! <bar> :JsREPL<Cr>

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


"============================================="
" In ~/.vim/ftplugin/javascript.vim, or somewhere similar.

" Enable ESLint only for JavaScript.
" let b:ale_linters = ['xo']

" Equivalent to the above.
" let b:ale_linters = {'javascript': ['tsserver']}

"  let g:ale_fixers = {
" \   'javascript': ['prettier'],
" \   'css': ['prettier'],
" \} 

"============================================="
