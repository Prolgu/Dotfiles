"==============================================="

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




"******** Indent *********"
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


function! BrowserPreview() abort
    exec "w"
    if &modified
        let tmpfile = tempname()
        execute "silent write " . tmpfile
        call system("firefox " . shellescape(tmpfile))
        if delete(tmpfile) != 0
            echoerr "could not remove " . tmpfile
        endif
    else
        call system("firefox " . shellescape(expand("%:p")))
    endif
endfunction

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

"************** Registro ****************"

function! Reg()
    reg
    echo "Register: "
    let char = nr2char(getchar())
    if char != "\<Esc>"
        execute "normal! \"".char."p"
    endif
    redraw
endfunction

" command! -nargs=0 Reg call Reg()

"******* Hex/Norm ********

noremap <F10> :call HexMe()<CR>
let $in_hex=0
function! HexMe()
    set binary
    set noeol
    if $in_hex>0
        :%!xxd -r
        let $in_hex=0
    else
        :%!xxd
    let $in_hex=1
    endif
endfunction

"============================ Floaterm ============================="

command! PyREPL  :FloatermNew --wintype=floating --width=0.5 --height=1.0 --position=right (python %)
command! JsREPL  :FloatermNew --wintype=floating --width=0.5 --height=1.0 --position=right (node %)
command! LuaREPL  :FloatermNew --wintype=floating --width=0.5 --height=1.0 --position=right (lua %)

"=================================================================="
"****************************** OLD *******************************"
"=================================================================="

function! Templates(key) abort
let numt ={
            \"1":"~/.vimtemplates/py",
            \"2":"~/.vimtemplates/sh",
            \"3":"~/.vimtemplates/c",
            \"4":"~/.vimtemplates/cpp",
            \"5":"~/.vimtemplates/html",
            \}

     exec "0r".get(numt,a:key)
endfunction


"*******************************"

function! Term() abort
    set splitbelow
    exec winheight(0)/4."split"|:w | terminal $SHELL
    "exec "vsp" | terminal $SHELL %
    set nonumber
    set norelativenumber
    set signcolumn=no
    startinsert!
endfunction

"************* ToggleTerm *************"
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height) abort
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf 
        catch
            call termopen('$SHELL', {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction


