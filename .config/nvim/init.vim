"============================================================="
"                       Mi NVimRC                             "
"============================================================="

"==============================================================
"    _______  ______    _______  ___      _______  __   __    "
"   |       ||    _ |  |  _    ||   |    |       ||  | |  |   "
"   |    _  ||   | ||  | | |   ||   |    |    ___||  | |  |   "
"   |   |_| ||   |_||_ | | |   ||   |    |   | __ |  |_|  |   "
"   |    ___||    __  || |_|   ||   |___ |   ||  ||       |   "
"   |   |    |   |  | ||       ||       ||   |_| ||       |   "
"   |___|    |___|  |_||_______||_______||_______||_______|   "
"                                                             "
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
"============================================================="


"============================================================="
"                         Plug-in                             "
"============================================================="

call plug#begin('~/.config/nvim/plugged')

  Plug 'tomasr/molokai' "Mi tema favorito
  Plug 'vim-scripts/loremipsum',{'for':'html'}  "generador lorem
  Plug 'szw/vim-g'  "google searcher
  Plug 'tpope/vim-commentary' "para comentar 
  Plug 'scrooloose/nerdtree'  "Visor de archivos
  Plug 'voldikss/vim-floaterm' "Terminal flotante
  Plug 'itchyny/lightline.vim' "linea estilizada
  Plug 'tpope/vim-fugitive'    "Git Wrapper
  Plug 'ryanoasis/vim-devicons' "Iconos varios
  Plug 'sainnhe/lightline_foobar.vim' 
  Plug 'mengelbrecht/lightline-bufferline' "bufferline como lightline
  Plug 'sheerun/vim-polyglot' "syntax highlight
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "fuzzy finder
  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}  "autocompletado,etc
  Plug 'honza/vim-snippets' 


call plug#end()
"============================================================"


"======================== Filetype =========================="
filetype plugin indent on
"========================= Mouse ============================"
set mouse=a
"========================= Visual ==========================="
set t_Co=256
colorscheme molokai 
set termguicolors
"============================================================"
"======================== Regleta ==========================="
set nu ruler rnu
" set nowrap
set fillchars=fold:\
" set cursorline
hi CursorLine cterm=NONE term=NONE  ctermbg=NONE 
"highlight clear CursorLine
highlight CursorLineNR ctermbg=Cyan ctermfg=Black cterm=bold 
highlight LineNr ctermfg=White  cterm=bold 
"highlight Normal guibg=black guifg=white
"Transparencia 
hi Normal ctermbg=NONE
"============================================================"
"====================== Codificacion ========================"
set encoding=utf-8 fileencoding=utf-8
scriptencoding utf-8
"======================= Busqueda ==========================="
set smartcase
set path+=**/*
set autochdir
"============================================================"
let g:netrw_banner=0
let loaded_matchit = 1
let g:molokai_original = 1 

let g:auto_save=1
let g:vim_g_command = "Go"
let g:vim_g_f_command = "Gfi"
let g:vim_g_query_url = "http://google.com/search?q="
let g:vim_g_open_command = "xdg-open"

let g:python3_host_prog=expand('/usr/bin/python3')
let g:loaded_node_provider = 1


"======================= General ============================"
set clipboard+=unnamed,unnamedplus
set showcmd noshowmode showmatch
set smartindent
set noswapfile nobackup
set hidden bufhidden=hide
set ff=unix ffs=unix,dos,mac
set lazyredraw
" set shortmess=aAItW
set shortmess+=c
set updatetime=300
set completeopt=menu,menuone,noinsert,noselect
set report=0 scrolloff=10
"============================================================"
silent! set noerrorbells visualbell t_vb=
"============================================================"

"========================== GSearch ========================="
" Busca la seleccion visual
let g:vim_g_command = "Go"
"========================== Splits =========================="
set splitbelow splitright
highlight VertSplit cterm=NONE
"========================= UndoFile ========================="
set undofile undodir=~/.config/nvim/undodir
set undolevels=5000
"====================== Status/Tabline ======================"
set showtabline=2
set tabpagemax=15 
"============================================================"
" Remember position of cursor in buffer
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
"============================================================"


"============================================================"
augroup vimrc-sync-fromstart
  autocmd!
  autocmd Bufenter * :syntax sync maxlines=80
augroup END	

augroup FileTypeAutocmds
  autocmd!
  autocmd FileType floaterm setlocal nocursorline
  autocmd FileType help setlocal number
  autocmd FileType * set formatoptions-=cro
augroup END
"============================================================"



"======================== Sources ==========================="
       "================= So-Plug ==================="
                " loaded in plugin folder

"============================================================"
"======================  Ultisnips =========================="

" let g:UltiSnipsExpandTrigger='<tab>'

" " shortcut to go to next position
" let g:UltiSnipsJumpForwardTrigger='<c-j>'

" " shortcut to go to previous position
" let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" let g:UltiSnipsSnippetDirectories=["UltiSnips", "mySnippets"]
" " If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
"============================================================"
" augroup suffixes
"   autocmd!
"   let association=[
"           \ ['javascript','.js,.javascript,.es,.esx,.json'],
"           \ ['python','.py,.pyw']
"           \ ]
"   for ft in association
"     execute 'autocmd FileType '. ft[0].' setlocal suffixesadd='.ft[1]
"   endfor
" augroup END


" augroup ParenColor
"   autocmd!
"   autocmd VimEnter,BufWinEnter *
"     \ if index(['html', 'htmldjango', 'mma', 'vue', 'xml','python','javascript'], &filetype) < 0 |
"       \ syntax match paren1 /[{}]/   | hi paren1 guifg=#FF00FF |
"       \ syntax match paren2 /[()]/   | hi paren2 guifg=#DF8700 |
"       \ syntax match paren3 /[<>]/   | hi paren3 guifg=#0087FF |
"       \ syntax match paren4 /[\[\]]/ | hi paren4 guifg=#00FF5F |
"     \ endif
" augroup END

"============================================================"
" autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
" autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
"============================================================"

