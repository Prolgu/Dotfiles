"**********************************************************
"********************** Mi VimRC**************************"

"**********************************************************
"**********************************************************
"    _______  ______    _______  ___      _______  __   __ 
"   |       ||    _ |  |  _    ||   |    |       ||  | |  |
"   |    _  ||   | ||  | | |   ||   |    |    ___||  | |  |
"   |   |_| ||   |_||_ | | |   ||   |    |   | __ |  |_|  |
"   |    ___||    __  || |_|   ||   |___ |   ||  ||       |
"   |   |    |   |  | ||       ||       ||   |_| ||       |
"   |___|    |___|  |_||_______||_______||_______||_______|
"
"**********************************************************
"**********************************************************


set nocompatible
filetype off
"Plug-in
"
call plug#begin('~/.vim/plugged')

Plug 'voldikss/vim-floaterm'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'sainnhe/lightline_foobar.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'ayu-theme/ayu-vim'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()


"********* Filetype *********"

filetype plugin indent on

if has("gui_running")
    "set fuoptions=maxvert,maxhorz
    source ~/.gvimrc
endif

 
"mouse 
set mouse=a
set clipboard+=unnamedplus

"************************
"" Visual
"************************

set t_Co=256

"Esquema de color
colorscheme ayu
"colorscheme material
let ayucolor="dark"
"colorscheme gruvbox
"let g:gruvbox_contrast_dark = "hard"
set background=dark

"set guifont="Font Awesome:h26"

syntax enable
set termguicolors
"highlight Normal ctermbg=NONE

"Ajuste de la regleta
set nu 
set ruler
"set nowrap
set rnu
set fillchars=fold:\

"Activa la linea del cursor y da color:
"set title
set cursorline
"hi CursorLine cterm=NONE term=NONE  ctermbg=black 
"Removes the underline causes by enabling cursorline:
"highlight clear CursorLine

"Setea la linea de cursor a gris y los numeros a blanco y negrita
"highlight CursorLineNR ctermbg=Cyan ctermfg=Black cterm=bold 
"highlight LineNr ctermfg=White  cterm=bold 
"highlight Normal guibg=black guifg=white
hi Normal ctermfg=Red ctermbg=Black 
"transparencia 
hi Normal  ctermbg=NONE

"Codificacion
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast

"seteo de los tab
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab

"activa buffer ocultos
set hidden

"busqueda
set hlsearch
set incsearch
set ignorecase
set smartcase
set path+=**

"wildmenu en el Cmd con Tab
set showcmd
set showmatch
set noshowmode
set smartindent
set wildmenu
"set wildmode=longest,list,full

set fileformats=unix,dos,mac

"highlight VertSplit cterm=NONE

if exists('$SHELL')
	set shell=$SHELL
else
	set shell=/bin/sh
endif	


"Setea archivo para Undo
set undodir=~/.vim/undodir
set undofile

"status Line
set showtabline=2
set laststatus=2
""let g:lightline = {
""      \ 'colorscheme': 'wombat',
""     \ }
"********** Mapleader ***********"

let mapleader=','
"******** status Line *********"

let g:lightline = {
\'colorscheme': 'neodark_alter',
\'active': {
\       'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'filename'], [ 'statuslinetabs' ] ],
\       'right' :[['lineinfo']]
\           },
\'subseparator': {
\       'left': '', 'right': ''   
\           },
\'separator': {
\       'left': '', 'right': ''
\           },
\'tabline': {
\       'left': [ ['buffers'] ],
\       'right': [['smarttabs','close']]
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
\       'percent': 'LightlinePercent',
\       'lineinfo': 'LightlineLineinfo',
\       'filename': 'LightlineFilename',
\       'mode': 'LightlineMode',
\       'gitbranch': 'LightlineGitbranch',
\       'readonly': 'LightlineReadonly',
\       'modified': 'LightlineModified',
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
    let l:lineinfo = ' ' . l:current_line . '/' . l:max_line
    return l:lineinfo
endfunction

function! LightlineFilename() abort
    let l:maxlen = winwidth(0) - winwidth(0) / 3
    let l:relative = expand('%:f')
    let l:tail = expand('%:t')
    let l:noname = 'No Name'

    if winwidth(0) < 50
        return ''
    endif

    if winwidth(0) < 86
        return l:tail ==# '' ? l:noname : s:trim(l:maxlen, l:tail)
    endif

    return l:relative ==# '' ? l:noname : s:trim(l:maxlen, l:relative)
endfunction

function! LightlineModified() abort
    return &modified ? '●' : ''
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
    return tabpagenr('$') >= 1 ? (' Tab: ' . tabs . '/' . tab_total) : ''
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
let g:lightline#bufferline#modified = ' ●'
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


"******** WebdevIcons ********* 

let g:webdevicons_enable = 1
" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree=1

"******* Tabline *******
"let no_buffers_menu = 1
set virtualedit=all
set showtabline=1
set tabpagemax=15 
"hi TabLineSel term=bold cterm=bold ctermfg=16 ctermbg=229 
"hi TabWinNumSel term=bold cterm=bold ctermfg=90 ctermbg=229 
"hi TabNumSel term=bold cterm=bold ctermfg=16 ctermbg=229 
"hi TabLine term=underline ctermfg=16 ctermbg=145 
"hi TabWinNum term=bold cterm=bold ctermfg=90 ctermbg=145 
"hi TabNum term=bold cterm=bold ctermfg=16 ctermbg=145 


"""""""""""""""""""""""""""""""""""""""
"""""""""""""NerdTree""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""

autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore = ['\.rbc$','\~$','\.pyc$','\.db$','\.sqlite$','__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$','*','\.swp$','\.bak$','\~$']
let g:NERDTreeShowBookmarks=1
"let g:NERDTreeGitStatusWithFlags = 1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent='<RightMouse>'
let g:NERDTreeWinsize=50
set wildignore+=*/tmp/*,*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
"nnoremap <silent> <F2> :NERDTreeFind<CR>
"nnoremap <silent> <F3> :NERDTreeToogle<CR>

"emulacion de terminal
nnoremap <silent> <leader>sh :terminal<CR>

if !exists('*s:setupWrapping')
  function s:setupWrapping()
	set wrap
	set wm=2
	set textwidth=79
  endfunction
endif

augroup vimrc-sync-fromstart
	autocmd!
	autocmd Bufenter * :syntax sync maxlines=250
augroup END	

function! TermZ() abort
    ""set splitbelow
    "exec winheight(0)/4."split"|:w | terminal 
    exec "terminal"
    set nonumber
    set norelativenumber
    set signcolumn=no
    startinsert!
endfunction


"******* Templates ********
"
"let g:key=0
function! Templates(key) abort
let numt ={
            \"1":"~/.vimtemplates/py.template",
            \"2":"~/.vimtemplates/sh.template",
            \"3":"~/.vimtemplates/c.template",
            \"4":"~/.vimtemplates/cpp.template",
            \}

"    for key in keys(numt)
"        echo key . ': ' . numt(key)
     exec "0r".get(numt,a:key)
"    endfor
endfunction


"*****************************
"*********** Mapeo ***********
"****************************

"Mapleader
let mapleader=','


" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

"Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" Directorio de trabajo
nnoremap <Leader>. :lcd %:p:h<CR>

"noremap <F4> :split term://python %<CR>

"****** RUN-PYTHON *********
noremap <F4> :call TermZ()<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>

"Zona de Remapeado
map <C-s> :w<Cr>
map <C-x> :q!<Cr>

"****** Tabs *****
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>
nnoremap <C-Left> :tabprevious<CR>                                                                            
nnoremap <C-Right> :tabnext<CR>

"*********** Templates **************"

nmap <Leader>1 :call Templates(1)<Cr> 
nmap <Leader>2 :call Templates(2)<Cr>
nmap <Leader>3 :call Templates(3)<Cr>
nmap <Leader>4 :call Templates(4)<Cr>


"********* Cambio de ventanas *******"
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"nnoremap <F7> :sp<bar>term<cr><c-w>J:resize10<cr>

"******** SourceFile *********"
"
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr> 

"********* Resize ***********"

noremap <C-Up> :resize +2<CR>
noremap <C-Down> :resize -2<CR>
noremap <C-Left> :vertical resize +2<CR>
noremap <C-Right> :vertical resize -2<CR>

" Disable arrow keys (helped me learn Vim, and I do not use them)
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
nnoremap q <nop>


"*****Copy/Paste******"
inoremap <C-v> <Esc> "+gP
nnoremap <C-v> "+gP
vnoremap <C-c> "+y

"Zona de Remapeado
map <C-s> :w<Cr>
map <C-x> :q<Cr>

