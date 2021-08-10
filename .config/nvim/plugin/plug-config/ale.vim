" vim:fileencoding=utf-8:ft=vim:foldmethod=marker


" ALE {{{=================================================

" let g:ale_completion_enabled = 0
" set omnifunc=ale#completion#OmniFunc
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
highlight clear ALEErrorSign
highlight clear ALEWarningSign
" Set this in your vimrc file to disabling highlighting
" let g:ale_set_highlights = 1
highlight ALEWarning ctermbg=Magenta
" Write this in your vimrc file
" let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 1
 " In ~/.vim/vimrc, or somewhere similar.
let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
let g:ale_linters = {'jsx': ['stylelint', 'eslint']}
" }}}
