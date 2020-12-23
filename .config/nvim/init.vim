"============================================================="
"********************** Mi NVimRC*****************************"
"============================================================="


"============================================================="
"*************************************************************"
"    _______  ______    _______  ___      _______  __   __    "
"   |       ||    _ |  |  _    ||   |    |       ||  | |  |   "
"   |    _  ||   | ||  | | |   ||   |    |    ___||  | |  |   "
"   |   |_| ||   |_||_ | | |   ||   |    |   | __ |  |_|  |   "
"   |    ___||    __  || |_|   ||   |___ |   ||  ||       |   "
"   |   |    |   |  | ||       ||       ||   |_| ||       |   "
"   |___|    |___|  |_||_______||_______||_______||_______|   "
"                                                             "
"*************************************************************"
"============================================================="

"========================= Filetype =========================="
filetype off

"============================================================="
"                   Auto Plug.vim install                     "
"============================================================="

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.vim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.vim/autoload/plug.vim
  autocmd VimEnter * PlugInstall
endif
 

"======================== Plug-in ============================"

call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-commentary' 
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

" Plug 'neovim/nvim-lspconfig' "instalar nightly primero

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-tslint', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'} " mru and stuff
" Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'} " color highlighting
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
  
call plug#end()


"======================== Filetype =========================="

filetype plugin indent on

"========================= Mouse ============================"

set mouse=a
set clipboard+=unnamed,unnamedplus

"========================= Visual ==========================="

"set t_Co=256
colorscheme ayu 
"let g:gruvbox_contrast_dark = "hard"
let ayucolor="dark"
set background=dark
syntax enable 
set termguicolors
"set guifont="Font Awesome:h12"


"======================== Regleta ==========================="

set nu 
set ruler
" set nowrap
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

"====================== Codificacion ========================"

set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8
setglobal fileencoding=utf-8

"======================= Busqueda ==========================="

set hlsearch
set incsearch
set smartcase
set path+=.,,,**/*
set autochdir

"======================= Wildmenu ==========================="

silent! set wildchar=9 nowildmenu wildmode=longest,full wildmenu wildoptions= wildignorecase fileignorecase
silent! set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib "stuff to ignore when tab completing
silent! set wildignore+=__pycache__,.stversions,*.spl,*.out,%*
silent! set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
silent! set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz
silent! set wildignore+=*DS_Store*,*.ipch
silent! set wildignore+=*.gem
silent! set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
silent! set wildignore+=*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
silent! set wildignore+=*/.nx/**,*.app,*.git,.git
silent! set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
silent! set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
silent! set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
silent! set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
silent! set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
silent! set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
silent! set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
silent! set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android
silent! set wildignore+=*/tmp/*,,*.db,*.sqlite
" set wildmenu
" set wildchar=<TAB>          
"set wildmode=list:longest
"set wildmode=longest,list,full

"====================== General ============================="

set showcmd
set showmatch
set noshowmode     
set lazyredraw
set smartindent
set noswapfile
set nobackup
set hidden
set ffs=unix,dos,mac
set ttyfast
" set shortmess+=c
 
set shortmess=aAItW

" autocmd FileType html,css,json,javascript
"     \ set tabstop=2 |
"     \ set softtabstop=2 |
"     \ set shiftwidth=2 |
"     \ set textwidth=120 |
"     \ set fileformat=unix |"

set completeopt=menu,menuone,noinsert,noselect

set report=0 

set scrolloff=10

"============================================================"

"========================== Bell ============================"
silent! set noerrorbells visualbell t_vb=

let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]



"========================= Splits ==========================="

highlight VertSplit cterm=NONE
set splitbelow splitright

"======================== UndoFile =========================="

set undodir=~/.config/nvim/undodir
set undofile

"===================== Status/Tabline ======================="

set showtabline=2
set tabpagemax=15 
set laststatus=2
set virtualedit=all

 
"============================================================"
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
"============================================================"

" Remember position of cursor in buffer
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

augroup suffixes
  autocmd!
  let association=[
          \ ['javascript','.js,.javascript,.es,.esx,.json'],
          \ ['python','.py,.pyw']
          \ ]
  for ft in association
    execute 'autocmd FileType '. ft[0].' setlocal suffixesadd='.ft[1]
  endfor
augroup END



augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
  autocmd FileType vue set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
  autocmd FileType jsx set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
  autocmd FileType less set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
  autocmd FileType scss set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
  autocmd FileType html set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
  autocmd FileType css set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
augroup END

augroup vimrc-sync-fromstart
  autocmd!
  autocmd Bufenter * :syntax sync maxlines=80
augroup END	


augroup ParenColor
  autocmd!
  autocmd VimEnter,BufWinEnter *
    \ if index(['html', 'htmldjango', 'mma', 'vue', 'xml','python','javascript'], &filetype) < 0 |
      \ syntax match paren1 /[{}]/   | hi paren1 guifg=#FF00FF |
      \ syntax match paren2 /[()]/   | hi paren2 guifg=#DF8700 |
      \ syntax match paren3 /[<>]/   | hi paren3 guifg=#0087FF |
      \ syntax match paren4 /[\[\]]/ | hi paren4 guifg=#00FF5F |
    \ endif
augroup END

augroup FileTypeAutocmds
  autocmd!
  autocmd FileType floaterm setlocal nocursorline
  autocmd FileType help setlocal number
  autocmd FileType * set formatoptions-=cro
augroup END



"====================== Sources ============================="
source ~/.config/nvim/maps.vim 
source ~/.config/nvim/funciones.vim 

"====================== So-Plug ============================="
source ~/.config/nvim/plug-config/nerdtree.vim 
source ~/.config/nvim/plug-config/fzf.vim
source ~/.config/nvim/plug-config/lightline.vim 
source ~/.config/nvim/plug-config/coc.vim 
source ~/.config/nvim/plug-config/ale.vim 
source ~/.config/nvim/plug-config/fterm.vim 
"============================================================"

