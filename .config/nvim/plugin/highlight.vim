" vim:fileencoding=utf-8:ft=vim:foldmethod=marker


" Transparencia   {{{============================================

hi Normal ctermbg=NONE guibg=NONE
hi LineNr ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
hi Folded guifg=DarkCyan gui=bold
" hi FoldColumn guifg=#44cc44

" }}}

" Visual          {{{============================================

hi Visual gui=bold guibg=black guifg=DarkMagenta
" hi Visual gui=bold guibg=black guifg=Darkcyan
" hi Visual gui=bold guibg=grey guifg=darkcyan
" hi Visual gui=reverse guibg=grey guifg=reverse
" hi Visual cterm=bold ctermbg=grey ctermfg=cyan

" highlight! link Visual CursorLine

" }}}

" Search Colors   {{{============================================

hi IncSearch guifg=red gui=italic,underline guibg=NONE
hi Search cterm=NONE guifg=red guibg=NONE gui=italic,underline
" hi Search gui=reverse guifg=
" highlight CursorLine cterm=NONE term=NONE  ctermbg=NONE 

" highlight NormalFloat cterm=NONE ctermfg=14 ctermbg=0 gui=NONE guifg=#93a1a1 guibg=#002931

" }}}

" Comment         {{{============================================

highlight Comment gui=italic,bold 
highlight VertSplit cterm=NONE
" set cursorline

" }}}
