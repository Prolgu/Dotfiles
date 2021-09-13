" vim:fileencoding=utf-8:ft=vim:foldmethod=marker

" MD-VIM  {{{=======================================

set ts=2 sw=2 sts=2 
set et 
set bs=indent,eol,start
set so=999
set linebreak
set wrap nolist
setlocal textwidth=80

" }}}

" MD-Fnc  {{{=======================================

" on/off para la colorcolumn
function Mdwrapper() abort
    if &colorcolumn
        set colorcolumn=0
    else
        set colorcolumn=+1
        set colorcolumn=80
    endif
endfunction
" Exporta/muestra PDF (%< = nombre de archivo sin ext )
command! ExportPDF :AsyncRun pandoc % -o %<.pdf
command! ShowPDF :AsyncRun zathura %<.pdf

" }}}

" MD-Maps {{{=======================================

inoremap <buffer>" ""<Esc>i

nnoremap <silent> <F7> :set spell!<Cr>
inoremap <silent> <F7> <C-O>:set spell!<Cr>

nnoremap <silent><buffer> <F5> :w <bar>:MarkdownPreview<Cr>
nnoremap <silent><buffer> <leader>mw :call Mdwrapper()<Cr>

inoremap <buffer> ~n ñ
inoremap <buffer> 'a á
inoremap <buffer> 'e é
inoremap <buffer> 'i í
inoremap <buffer> 'o ó
inoremap <buffer> 'u ú

imap <buffer>"<tab> ""<Left>
imap <buffer>'<tab> ''<Left>
imap <buffer>(<tab> ()<Left>
imap <buffer>[<tab> []<Left>
imap <buffer>{<tab> {}<Left>
" imap <buffer>{<CR> {<CR>}<ESC>O
" imap <buffer>{;<CR> {<CR>};<ESC>O

" wrap the current line in (), e.g:
" nnoremap (( mMI(<esc>A)<esc>`M

" wrap the rest of the line in ()
" nnoremap )) mMi(<esc>A)<esc>`M

" wrap the line so far in ()
" nnoremap () mMI(<esc>`Mla)<esc>


" nnoremap "" mMi"<esc>A"<esc>`M
nnoremap (( ciw(<Esc>pa)<Esc>
vnoremap (( c(<Esc>)P<Esc>

" }}}
