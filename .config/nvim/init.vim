" Mi NVimRC ===================================================
" =============================================================
"    _______  ______    _______  ___      _______  __   __    "
"   |       ||    _ |  |  _    ||   |    |       ||  | |  |   "
"   |    _  ||   | ||  | | |   ||   |    |    ___||  | |  |   "
"   |   |_| ||   |_||_ | | |   ||   |    |   | __ |  |_|  |   "
"   |    ___||    __  || |_|   ||   |___ |   ||  ||       |   "
"   |   |    |   |  | ||       ||       ||   |_| ||       |   "
"   |___|    |___|  |_||_______||_______||_______||_______|   "
"                                                             "
" =============================================================
" =============================================================



" Auto Plug.vim install {{{=====================================

filetype off

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
  autocmd VimEnter * PlugInstall
endif

filetype plugin indent on

" }}}

" Plug-in {{{===================================================

call plug#begin('~/.config/nvim/plugged')

  Plug 'tomasr/molokai'   " Mi tema favorito
  Plug 'morhetz/gruvbox'
  Plug 'vim-scripts/loremipsum',{'for':'html'}    " Generador lorem
  Plug 'szw/vim-g'    " Google searcher
  Plug 'tpope/vim-fugitive'   " Git Wrapper
  Plug 'tpope/vim-commentary'   " Para comentar 
  Plug 'voldikss/vim-floaterm'    "Terminal Flotante
  Plug 'ryanoasis/vim-devicons'   "Iconos Varios
  Plug 'sheerun/vim-polyglot'   " Syntax Highlight
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy Finder
  Plug 'junegunn/fzf.vim'   "Fuzzy Finder

  " The bang version will try to download the prebuilt binary if cargo does not exist.
  Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}  "autocompletado,etc
  Plug 'honza/vim-snippets'   " Snippets
  Plug 'akinsho/nvim-bufferline.lua'    "Bufferline en lua
  Plug 'kyazdani42/nvim-web-devicons'   " Nvim Icons en lua
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
  Plug 'nvim-treesitter/nvim-treesitter-refactor'
  Plug 'neovim/nvim-lspconfig'
  Plug 'simnalamburt/vim-mundo' "Undo tree
  Plug 'hrsh7th/nvim-compe'

  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } "Markdown preview

  Plug 'mhinz/vim-startify' " Startify

call plug#end()

" }}}

" Lua-Call {{{==================================================

" lua require('line')
lua require('buffy')
lua require('map')
lua require('tree')
lua require('lsp')




" }}}

" General {{{===================================================

" set termguicolors
" colorscheme molokai
colorscheme gruvbox
" set t_Co=256
" set updatetime=100 timeout timeoutlen=500 ttimeout ttimeoutlen=50

" autocmd VimEnter,WinEnter * let &scrolloff = winheight(0) / 4
" au TermOpen *fzf* :tnoremap <buffer>
au TermEnter * setlocal scrolloff=0
au TermLeave * setlocal scrolloff=3
" hi! link FoldColumn Folded
" hi! link CursorColumn	CursorLine
" hi! link NonText LineNr
" }}}

" Definitions {{{===============================================

" Various ====================
let g:netrw_banner=0
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_liststyle = 3

let g:loaded_matchit = 1
" let g:molokai_original = 1 

let g:python3_host_prog=expand('/usr/bin/python3')
let g:loaded_node_provider = 1
" Gruvbox
let g:gruvbox_bold=1
let g:gruvbox_italic=1
let g:gruvbox_underline=1

" Vim-G ====================
let g:vim_g_command = "Go"
let g:vim_g_f_command = "Gfi"
let g:vim_g_query_url = "http://google.com/search?q="
let g:vim_g_open_command = "xdg-open"


" Mundo tree ================
let g:mundo_preview_bottom=1
let g:mundo_right=1
let g:mundo_width = 30
let g:mundo_preview_height = 15

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger='<tab>'

" shortcut to go to next position
let g:UltiSnipsJumpForwardTrigger='<c-j>'

" shortcut to go to previous position
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
" Vim Clap
let g:clap_theme = 'material_design_dark'
" }}}

" Remember cursor position {{{==================================

autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" }}}

" Transparencia en pmenu y floaterm {{{=========================

if exists('&pumblend')
	set pumblend=10
	" set winblend=85
	hi PmenuSel blend=10
endif

"}}}

" Nornu noruler en fzf {{{======================================

if has('nvim') && !exists('g:fzf_layout')
  autocmd! FileType fzf
  autocmd  FileType fzf set nornu noruler
    \| autocmd BufLeave <buffer> set rnu ruler
endif

"}}}

" Autocmd {{{===================================================

autocmd InsertEnter * :set nornu
autocmd InsertLeave * :set rnu


" autocmd BufWinEnter,WinEnter term://* startinsert
" autocmd BufLeave term://* stopinsert
autocmd TermOpen * startinsert
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" }}}

" Augroup {{{===================================================

" hi WildMenu guibg=DarkGray
" autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc

" augroup vimrc-sync-fromstart
"   autocmd!
"   autocmd BufEnter * :syntax sync maxlines=80
" augroup END	

augroup initvim-syncformat
  autocmd!
  autocmd BufEnter * :syntax sync fromstart
augroup END

augroup FileTypeAutocmds
  autocmd!
  autocmd FileType floaterm setlocal nocul nornu nonu noru
  autocmd FileType help setlocal number
  autocmd FileType * set formatoptions-=cro
augroup END

" add highlight to rofi files
au BufReadPost *.rasi set ft=css

augroup CocExplorerCustom
  autocmd!
  " autocmd FileType coc-explorer setlocal relativenumber
  autocmd BufEnter coc-explorer
    \ if &ft == 'coc-explorer'
    \ | call CocAction('runCommand', 'explorer.doAction', 'closest', ['refresh'])
    \ | endif
augroup END

" augroup CursorLine
"   au!
"   au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"   au WinLeave * setlocal nocursorline
" augroup END

"}}}


nnoremap q: <nop>

" set fillchars=vert::
command! Ghistory :0Gclog -- %

if has("nvim")
  au TermOpen * tnoremap <Esc> <c-\><c-n>
  au FileType fzf tunmap <Esc>
endif


" depreC {{{1

" Compile/Run {{{2===============================================
" nmap <leader>co :w <Cr> :!clear && gcc % <Cr>
" nmap <leader>cr :w <Cr> :!clear && gcc % -o %< && ./%< <Cr>

" vnoremap <leader>ff :echo expand('<cword>')<Cr>
" nmap <leader>yw yiw

"CapsLock is esc now! {{{2=====================================

" au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
" au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'


" vim:fileencoding=utf-8:ft=vim:foldmethod=marker

