" vim:fileencoding=utf-8:ft=vim:foldmethod=marker

" Share {{{==============================================="

function! s:share() range
  let n=@n
  silent! normal gv"ny
  let out= system("echo '".@n."' | curl --silent --data-binary @- https://paste.rs")
  let @n =n
  " normal `>
  " put=''
  " put='Share:'
  " put=out
  exec "!xdg-open ".out
endfunction

command! -range Share :call s:share()<Cr>
" }}}



" Indent {{{===============================================
let g:indentguides_state = 0
function! IndentGuides() abort
    if g:indentguides_state
        let g:indentguides_state = 0
        2match None
    else
        let g:indentguides_state = 1
        execute '2match IndentGuides /\%(\_^\s*\)\@<=\%(\%'.(0*&sw+1).'v\|\%'.(1*&sw+1).'v\|\%'.(2*&sw+1).'v\|\%'.(3*&sw+1).'v\|\%'.(4*&sw+1).'v\|\%'.(5*&sw+1).'v\|\%'.(6*&sw+1).'v\|\%'.(7*&sw+1).'v\)\s/'
    endif
endfunction
hi def IndentGuides guibg=#303030
" }}}



" Salt/JumpToCSS {{{=======================================================

function! Salt() abort
    " let l:Command = expand("<cfile>")
   " execute "tabnew " . l:Command
  execute "tabnew ".expand("<cfile>")
endfunction

function! JumpToCSS() abort
  let id_pos = searchpos("id", "nb", line('.'))[1]
  let class_pos = searchpos("class", "nb", line('.'))[1]

  if class_pos > 0 || id_pos > 0
    if class_pos < id_pos
      execute ":vim '#".expand('<cword>')."' **/*.css"
    elseif class_pos > id_pos
      execute ":vim '.".expand('<cword>')."' **/*.css"
    endif
  endif
endfunction

" }}}



" Floaterm {{{============================="

" Terminal
silent command! Termy  :FloatermNew --wintype=normal --width=0.5 --height=0.4 --position=center --autoclose=2 ($SHELL)
" Terminales para lenguajes(<F5>)
silent command! PyREPL  :FloatermNew --wintype=normal --width=0.5 --height=0.4 --position=center (python %)
silent command! JsREPL  :FloatermNew --wintype=normal --width=0.5 --height=0.4 --position=center (node %)
silent command! LuaREPL :FloatermNew --wintype=normal --width=0.5 --height=0.4 --position=center (lua %)
silent command! ShREPL  :FloatermNew --wintype=normal --width=0.5 --height=0.4 --position=center ($SHELL %)
silent command! CREPL  :FloatermNew --wintype=normal --width=0.5 --height=0.4 --position=center (clear && gcc % -o %< && ./%<)
silent command! CPPREPL  :FloatermNew --wintype=normal --width=0.5 --height=0.4 --position=center (clear && g++ % -o %< && ./%<)
" silent command! LIVES  :FloatermNew --wintype=normal --width=0.5 --height=0.4 --position=center ()
" map <F9> :!g++ -g % -o %:r && ./%:r <CR>
" tnoremap <A-n> <Cmd>FloatermNew<CR><Cmd>startinsert<CR>

" }}}

