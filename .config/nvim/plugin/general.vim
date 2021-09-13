" vim:fileencoding=utf-8:ft=vim:foldmethod=marker

" Dictionary ========================"
" set dictionary+=~/.config/nvim/dict/dictionary
" UndoFile ========================="
" set undofile undodir=~/.config/nvim/undodir

"Sets Varios {{{======================================================
set path+=**/*
set noswapfile nobackup
set undofile undodir+=~/.config/nvim/undodir
set dictionary+=~/.config/nvim/dict/dictionary
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
set undolevels=5000
set showtabline=2 report=0
set sidescroll=5
set mouse=a
set helpheight=20
set shortmess+=c
set clipboard+=unnamedplus
set nojoinspaces
set shiftround termguicolors noshowmode
set splitbelow splitright
set showmatch nu rnu
set nowrap whichwrap=b,s
set fillchars=fold:\
set completeopt=menuone,noinsert,noselect

set signcolumn=number
" set gcr=a:blinkon0
set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
set clipboard+=unnamedplus
set incsearch 
set smartcase
" Cursor on middle of buffer
set scrolloff=999

silent! set noerrorbells visualbell t_vb=

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set hidden

"}}}

" Codificacion ==============================================

scriptencoding utf-8

" }}}
