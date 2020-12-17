"************ NerdTree *************"
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"let g:NERDTreeDirArrowExpandable = '▸'
 let g:NERDTreeDirArrowExpandable = '►'
" let g:NERDTreeDirArrowExpandable = '+'
"let g:NERDTreeDirArrowCollapsible = '▾'
 let g:NERDTreeDirArrowCollapsible = '▼'
" let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "=",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeShowIgnoredStatus = 1
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore = ['\.rbc$','\~$','\.pyc$','\.db$','\.sqlite$','__pycache__','\.swp']
let g:NERDTreeSortOrder=['^__\.py$', '\/$','*','\.swp$','\.bak$','\~$']
let g:NERDTreeShowBookmarks=1
let g:NERDTreeGitStatusWithFlags = 1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent='<RightMouse>'
"let g:NERDTreeWinsize=50
let g:NERDTreeWinPos = 'left'

