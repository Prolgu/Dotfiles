function! TermJS() abort
    set splitbelow
    exec winheight(0)/4."split"|:w | terminal node %
    "exec "vsp" | term node %
    set nonumber
    set norelativenumber
    set signcolumn=no
    startinsert!
endfunction

" Terminal Function
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
            call termopen('node', {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction


"********* Map-Zone ***********"

" Toggle terminal on/off (neovim)
nnoremap <buffer> <A-t> :call TermToggle(10)<CR>
inoremap <buffer> <A-t> <Esc>:call TermToggle(10)<CR>
tnoremap <buffer> <A-t> <C-\><C-n>:call TermToggle(10)<CR>

"noremap <buffer> <F5> :call TermJS()<Cr>
noremap <buffer> <F5> :FloatermNew node %<Cr>

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

