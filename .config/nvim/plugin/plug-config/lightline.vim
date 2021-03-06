"*************************************************"

"================================================="
"                  lightline                      "
"==================================================

"*************************************************"
let g:lightline = {
\'colorscheme': 'ayu_dark',
\'active': {
\       'left': [ [ 'mode','paste' ], ['filename'], [ 'cocstatus', 'currentfunction','statuslinetabs' ] ],
\       'right' :[['gitbranch','linep'],['filetype']]
\           },
\'subseparator': {
\       'left': '', 'right': ''   
\           },
\'separator': {
\       'left': '', 'right': ''
\           },
\'tabline': {
\       'left': [ ['buffers'] ],
\       'right': [['smarttabs']]
\           },
\'component_expand': {
\       'buffers': 'lightline#bufferline#buffers',
\       'smarttabs': 'SmartTabsIndicator',
\       'trailing': 'lightline#trailing_whitespace#component'
\           },
\'component_type': {
\       'buffers': 'tabsel',
\       'trailing': 'warning'
\           },
\'component_function': {
\       'linep':'LightlinePercentLine',
\       'percent': 'LightlinePercent',
\       'lineinfo': 'LightlineLineinfo',
\       'filename': 'LightlineFilename',
\       'mode': 'LightlineMode',
\       'gitbranch': 'LightlineGitbranch',
\       'readonly': 'LightlineReadonly',
\       'modified': 'LightlineModified',
\       'cocstatus': 'coc#status',
\       'currentfunction': 'CocCurrentFunction',
\       'filetype': 'LightlineFiletype',
\           },
\ }

"\       'filetype': 'MyFiletype',
"\       'fileformat': 'MyFileformat',
"\       'explorer_pad': 'lightline#explorer_pad#left_pad',

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
"&fileformat . 
function! MyFileformat()
  return winwidth(0) > 70 ? ('' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightlineStatuslineTabs() abort
  return join(map(range(1, tabpagenr('$')),
        \ '(v:val == tabpagenr() ? "@" : "") . lightline#tab#filename(v:val)'), " \u2b81 ")
endfunction

function! LightlineWebDevIcons(n)
  let l:bufnr = tabpagebuflist(a:n)[tabpagewinnr(a:n) - 1]
  return WebDevIconsGetFileTypeSymbol(bufname(l:bufnr))
endfunction


function! s:trim(maxlen, str) abort
    let trimed = len(a:str) > a:maxlen ? a:str[0:a:maxlen] . '..' : a:str
    return trimed
endfunction

function! LightlineCoc() abort
    if winwidth(0) < 60
        return ''
    endif

    return coc#status()
endfunction

function! LightlinePercent() abort
    if winwidth(0) < 60
        return ''
    endif

    let l:percent = line('.') * 100 / line('$') . '%'
    return printf('%-4s', l:percent)
endfunction

function! LightlineLineinfo() abort
    if winwidth(0) < 86
        return ''
    endif

    let l:current_line = printf('%-3s', line('.'))
    let l:max_line = printf('%-3s', line('$'))
    let l:lineinfo = 'ln ' . l:current_line . '/' . l:max_line
    return l:lineinfo
endfunction

function LightlinePercentLine() abort
    if winwidth(0)< 86
        return ''
    endif

    let l:percent = line('.') * 100 / line('$') . '%'

    let l:current_line = printf('%-3s', line('.'))
    let l:max_line = printf('%-3s', line('$'))
    let l:lineinfo = 'ln [' . l:percent . '/' . l:max_line.']'
    return l:lineinfo
endfunction




function! LightlineFilename() abort
    let l:maxlen = winwidth(0) - winwidth(0) / 3
    let l:relative = expand('%:f')
    let l:tail = expand('%:t')
    let l:noname = 'No Name'

    if winwidth(0) < 30
        return ''
    endif

    if winwidth(0) < 56
        return l:tail ==# '' ? l:noname : s:trim(l:maxlen, l:tail)
    endif

    return l:relative ==# '' ? l:noname : s:trim(l:maxlen, l:relative)
endfunction

function! LightlineModified() abort
    return &modified ? '+' : ''
endfunction

function! LightlineMode() abort
  return expand('%:t') ==# 'NERD_tree' ? 'NERD':
        \ lightline#mode()
endfunction

function! LightlineReadonly() abort
    return &readonly ? '' : ''
endfunction

function! LightlineGitbranch() abort
    if exists('*fugitive#head')
        let maxlen = 20
        let branch = fugitive#head()
        return branch !=# '' ? ' '. s:trim(maxlen, branch) : ''
    endif
    return fugitive#head()
endfunction

function! LightlineFiletype() abort
    let l:icon = WebDevIconsGetFileTypeSymbol()
    return winwidth(0) > 86 ? (strlen(&filetype) ? &filetype . ' ' . l:icon : l:icon) : ''
endfunction

function! String2()
    return 'BUFFERS'
endfunction

function! SmartTabsIndicator() abort
    let tabs = lightline#tab#tabnum(tabpagenr())
    let tab_total = tabpagenr('$')
    return tabpagenr('$') >= 1 ? ('Buffers: ' . tabs . '/' . tab_total) : ''
endfunction


" autoreload
command! LightlineReload call LightlineReload()

function! LightlineReload() abort
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
endfunction

let g:lightline#bufferline#unnamed = 'Nuevo'
"let g:lightline#bufferline#filename_modifier= ':.'
let g:lightline#bufferline#more_buffers = '...'
let g:lightline#bufferline#modified = ' +'
let g:lightline#bufferline#read_only = ' '
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#show_number = 0
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#enable_devicons=1
let g:lightline#bufferline#clickable=1

"******* lightline_foobar options ******
let g:lightline_foobar_bold = 1
let g:lightline#trailing_whitespace#indicator = ''
"autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

 function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
"       \ },
"       \ 'component_function': {
"       \   'cocstatus': 'coc#status',
"       \   'currentfunction': 'CocCurrentFunction'
"       \ },
"       \ }
