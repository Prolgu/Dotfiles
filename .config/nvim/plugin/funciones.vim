" vim:fileencoding=utf-8:ft=vim:foldmethod=marker


" Share {{{==============================================="

function! s:share() range
  let n=@n
  silent! normal gv"ny
  let out= system("echo '".@n."' | curl --silent --data-binary @- https://pastebin.com")
  let @n =n
  " normal `>
  " put=''
  " put='Share:'
  " put=out
  exec "!xdg-open ".out
  " let @+ = out
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
silent command! PyCMD  :FloatermNew --wintype=normal --width=0.5 --height=0.4 --position=center (python %)
silent command! JsCMD  :FloatermNew --wintype=normal --width=0.5 --height=0.4 --position=center (node %)
silent command! LuaCMD :FloatermNew --wintype=normal --width=0.5 --height=0.4 --position=center (lua %)
silent command! ShCMD  :FloatermNew --wintype=normal --width=0.5 --height=0.4 --position=center ($SHELL %)
silent command! CCMD   :FloatermNew --wintype=normal --width=0.5 --height=0.4 --position=center (clear && gcc % -o %< && ./%<)
silent command! CppCMD :FloatermNew --wintype=normal --width=0.5 --height=0.4 --position=center (clear && g++ % -o %< && ./%<)
" silent command! LIVES  :FloatermNew --wintype=normal --width=0.5 --height=0.4 --position=center ()
" map <F9> :!g++ -g % -o %:r && ./%:r <CR>
" tnoremap <A-n> <Cmd>FloatermNew<CR><Cmd>startinsert<CR>

" }}}

" Dirr funct {{{1 
function Dirr() abort
  execute 'lcd %:p:h'
  echomsg expand('%:p:h')
  " let l:dr=expand('%:p:h')
  " echomsg l:dr 
endfunction
  
command! Cwd :call Dirr() 

" GitHistory {{{1 
command! Ghistory :0Gclog -- %


" FloatingWin(Under testing) {{{1
function! OpenFloatingWin()
  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  "Set the position, size, etc. of the floating window.
  "The size configuration here may not be so flexible, and there's room for further improvement.
  let opts = {
        \ 'relative': 'editor',
        \ 'row': height * 0.3,
        \ 'col': col + 30,
        \ 'width': width * 2 / 3,
        \ 'height': height / 2
        \ }

  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)

  "Set Floating Window Highlighting
  call setwinvar(win, '&winhl', 'Normal:Pmenu')

  setlocal
        \ buftype=nofile
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction
" deprec {{{1
