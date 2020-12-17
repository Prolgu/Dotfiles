"**********************************************************
"********************** Mi NVimRC**************************"

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

"********* Filetype *********"

filetype off


"=================================="
"      Auto Plug.vim install       "
"=================================="
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
        echo "Downloading junegunn/vim-plug to manage plugins..."
        silent !mkdir -p ~/.config/nvim/autoload/
        silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
        autocmd VimEnter * PlugInstall
endif
 

"********** Plug-in *************"

call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'voldikss/vim-floaterm'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'sainnhe/lightline_foobar.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'ayu-theme/ayu-vim'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


"********* Filetype *********"

filetype plugin indent on

"******* Mouse **********

set mouse=a
set clipboard+=unnamed,unnamedplus
"******* Visual *********

"set t_Co=256
colorscheme ayu 
"let g:gruvbox_contrast_dark = "hard"
let ayucolor="dark"
set background=dark
syntax enable 
set termguicolors
"set guifont="Font Awesome:h12"

"*********** Regleta **************

set nu 
set ruler
set nowrap
set rnu
set fillchars=fold:\
set cursorline

hi CursorLine cterm=NONE term=NONE  ctermbg=black 
"highlight clear CursorLine
highlight CursorLineNR ctermbg=Cyan ctermfg=Black cterm=bold 
highlight LineNr ctermfg=White  cterm=bold 
"highlight Normal guibg=black guifg=white
"Transparencia 
"hi Normal  ctermbg=NONE

"***** Codificacion *****

set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8
setglobal fileencoding=utf-8
set spelllang=es,cjk

"********************************************************
"
"wget http://ftp.vim.org/vim/runtime/spell/es.latin1.spl
"wget http://ftp.vim.org/vim/runtime/spell/es.latin1.sug
"wget http://ftp.vim.org/vim/runtime/spell/es.utf-8.spl
"wget http://ftp.vim.org/vim/runtime/spell/es.utf-8.sug
"
"********************************************************

"****** Tab-indent *******

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start

"********** Busqueda ************"

set hlsearch
set incsearch
set ignorecase
set smartcase
set path+=**

"********** Wildmenu ************"

set wildmenu
set wildchar=<TAB>          
"set wildmode=list:longest
"set wildmode=longest,list,full

set wildignore+=*/tmp/*,*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,*.DS_STORE
"*********** General ************"

set showcmd
"set cmdheight=2
set showmatch
set noshowmode     
set lazyredraw
set smartindent
set noswapfile
set nobackup
set hidden
set ffs=unix,dos,mac
set ttyfast
set shortmess+=c

"set fileformats=unix,dos,mac
autocmd FileType html,css,json,javascript
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=120 |
    \ set fileformat=unix |"

"*************************
highlight VertSplit cterm=NONE
set splitbelow splitright

"******** UndoFile ********

set undodir=~/.config/nvim/undodir
set undofile

"******** status Line *********"

set laststatus=2
"******** WebdevIcons ********* 

let g:webdevicons_enable = 1
" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree=1

"******* Tabline *******

set virtualedit=all
set showtabline=1
set tabpagemax=15 
"hi TabLineSel term=bold cterm=bold ctermfg=16 ctermbg=229 
"hi TabWinNumSel term=bold cterm=bold ctermfg=90 ctermbg=229 
"hi TabNumSel term=bold cterm=bold ctermfg=16 ctermbg=229 
"hi TabLine term=underline ctermfg=16 ctermbg=145 
"hi TabWinNum term=bold cterm=bold ctermfg=90 ctermbg=145 
"hi TabNum term=bold cterm=bold ctermfg=16 ctermbg=145 

"************NerdTree******************



"************ ControlP ***************"

if !exists('*s:setupWrapping')
  function s:setupWrapping()
	set wrap
	set wm=2
	set textwidth=80
  endfunction
endif

augroup vimrc-sync-fromstart
	autocmd!
	autocmd Bufenter * :syntax sync maxlines=80
augroup END	

"**********************************"                                   
source ~/.config/nvim/funciones.vim
source ~/.config/nvim/maps.vim
"**********************************"
source ~/.config/nvim/plug-config/nerdtree.vim
source ~/.config/nvim/plug-config/fzf.vim
source ~/.config/nvim/plug-config/cocrc.vim
source ~/.config/nvim/plug-config/lightline.vim
