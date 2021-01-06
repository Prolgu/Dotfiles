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
" Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-tslint', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'} " mru and stuff
" Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'} " color highlighting
" Plug 'dense-analysis/ale'
" Plug 'prettier/vim-prettier', {
"   \ 'do': 'yarn install',
"   \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

Plug  'honza/vim-snippets' 


call plug#end()
"============================================================"


"======================== Filetype =========================="
filetype plugin indent on
"========================= Mouse ============================"
set mouse=a
"========================= Visual ==========================="
set t_Co=256
colorscheme molokai 
set background=dark
set termguicolors
let g:molokai_original = 1 
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
set hlsearch incsearch smartcase
set path+=**/*
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

"============================================================"
"======================= General ============================"
set clipboard+=unnamed,unnamedplus
set showcmd noshowmode showmatch
set smartindent
set noswapfile nobackup
set hidden bufhidden=hide
set ff=unix ffs=unix,dos,mac
set ttyfast lazyredraw
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
"====================== Status/Tabline ======================"
set showtabline=2 laststatus=2
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

