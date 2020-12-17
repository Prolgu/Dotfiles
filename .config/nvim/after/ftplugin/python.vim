function! Termpy() abort
    set splitbelow
    exec winheight(0)/4."split"|:w | terminal python %
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
            call termopen('python', {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

function! Termy() abort
    call FloatermNew (python %)    
endfunction


"********* Map-Zone ***********"

" Toggle terminal on/off (neovim)
nnoremap <buffer> <A-t> :call TermToggle(10)<CR>
inoremap <buffer> <A-t> <Esc>:call TermToggle(10)<CR>
tnoremap <buffer> <A-t> <C-\><C-n>:call TermToggle(10)<CR>

nnoremap <buffer> <F5> :call Termy()<Cr>
nnoremap <buffer> <F5> :FloatermNew python %<Cr>

"******** Autocompletar *******"

inoremap <buffer>( ()<Esc>i
inoremap <buffer>[ []<Esc>i
inoremap <buffer>' ''<Esc>i
inoremap <buffer>" ""<Esc>i
inoremap <buffer>{ {}<Esc>i
inoremap <buffer>{<Cr> {<Cr>}<Esc>O
inoremap <buffer>< <><Esc>i


