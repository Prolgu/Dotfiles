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

inoremap <buffer> > ></<C-x><C-o><C-y><C-o>%<C-o>i
nnoremap <buffer> <leader>6 :r ~/.vimtemplates/ipsum.template<Cr>

"nnoremap <buffer> <silent> <F5> :call BrowserPreview()<CR>
nnoremap <buffer> <F5> :w <Bar> !xdg-open %<CR>
inoremap <buffer> <leader>b <br/>

inoremap <buffer>" ""<Esc>i
