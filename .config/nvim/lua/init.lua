-- local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
-- local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
-- local g = vim.g 

-- local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

-- local function opt(scope, key, value)
--   scopes[scope][key] = value
--   if scope ~= 'o' then scopes['o'][key] = value end
-- end




-- local indent = 2
-- vim.g.mapleader = ","
-- -- vim.cmd('let g:hello="hello"')
-- -- vim.cmd('echo hello')
-- vim.cmd('colorscheme molokai')

-- -- Buffer Specs   ====================================
-- opt('b', 'shiftwidth', indent)                        -- Size of an indent
-- opt('b', 'tabstop', indent)                           -- Number of spaces tabs count for
-- opt('b', 'expandtab', true)                           -- Use spaces instead of tabs
-- opt('b', 'smartindent', true)                         -- Insert indents automatically

-- -- Windows Specs  ====================================
-- -- opt('w', 'list', false)                               -- Show some invisible characters (tabs...)
-- opt('w', 'number', true)                              -- Print line number
-- opt('w', 'relativenumber', true)                      -- Relative line numbers
-- opt('w', 'wrap', false)
-- -- opt('o', 'whichwrap', 'b,s')

-- -- Global Specs   ====================================
-- opt('o', 'completeopt', 'menuone,noinsert,noselect')  -- Completion options (for deoplete)
-- opt('o', 'fillchars', 'fold:\\')
-- opt('o', 'hidden', true)                              -- Enable modified buffers in background
-- opt('o', 'bufhidden','hide')
-- -- Dictionary     ====================================
-- opt('o', 'dictionary', '~/.config/nvim/dict/dictionary')

-- -- UndoFile       ====================================
-- opt('o', 'undofile', true)
-- opt('o', 'undodir','~/.config/nvim/undodir')

-- -- Search         ====================================
-- opt('o', 'smartcase', true)
-- opt('o', 'ignorecase', true)                          -- Ignore case
-- opt('o', 'showmatch', true)                           -- Show 
-- opt('o', 'matchtime', 0)
-- -- Wrap           ====================================
-- opt('o', 'wrap', false)
-- opt('o', 'wrapmargin', 0)
-- opt('o', 'magic', true)
-- opt('o', 'wrapscan', true)

-- -- Splits         ====================================
-- opt('o', 'splitbelow', true)                          -- Put new windows below current
-- opt('o', 'splitright', true)                          -- Put new windows right of current
-- -- Term/Wmode     ====================================
-- opt('o', 'termguicolors', true)                       -- True color support
-- opt('o', 'wildmode', 'list:longest')                  -- Command-line completion mode

-- -- Cmd Line       ====================================
-- opt('o', 'showcmd', true)
-- opt('o', 'warn', false)
-- opt('o', 'confirm', false)
-- opt('o', 'showmode', false)

-- -- Title/Icon     ====================================
-- -- opt('o', 'title', true)
-- -- opt('o', 'titleold', '')
-- -- opt('o', 'titlelen', 100)
-- -- opt('o', 'icon', false)

-- -- Path/swap/bkup ====================================
-- opt('o', 'path', '**/*')
-- opt('o', 'swapfile', false)
-- opt('o', 'backup', false)
-- opt('o', 'report', 1)

-- -- Scrolls        ====================================
-- opt('o', 'scrolloff', 5)
-- opt('o', 'sidescroll', 5)

-- -- Tabline       ====================================
-- opt('o', 'showtabline', 2)
-- opt('o', 'tabpagemax', 10)

-- -- Varios         ====================================
-- opt('o', 'mouse', 'a')
-- opt('o', 't_Co', '256')
-- opt('o', 'smartcase', true)                           -- Don't ignore case with capitals
-- opt('o', 'joinspaces', false)                         -- No double spaces with join after a dot
-- opt('o', 'scrolloff', 5 )                             -- Lines of context
-- opt('o', 'shiftround', true)                          -- Round indent
-- opt('o', 'sidescrolloff', 5 )                         -- Columns of context
-- opt('o', 'autochdir', false)                           -- autochdir
-- opt('o', 'lazyredraw', true)
-- opt('o', 'clipboard', 'unnamed,unnamedplus' )
-- opt('o', 'fileformat', 'unix')
-- opt('o', 'ffs', 'unix,dos,mac')
-- opt('o', 'shortmess', 'c')
-- opt('o', 'cpoptions', 'I')
-- opt('o', 'fileencoding', 'utf-8')
-- opt('o', 'display', 'lastline,uhex')
-- opt('o', 'pumblend', 10)                              -- transparency on pmenu
-- opt('o', 'winblend', 10)                              -- transparency on floatwin
-- opt('o', 'helpheight', 25)




-- background dark            -- Enabled by default
-- ruler                      -- Enabled by default
-- laststatus                 -- Enabled by default
-- hlsearch                   -- Enabled by default
-- ttyfast                    -- Enabled by default
-- encoding utf-8             -- Enabled by default
-- filetype plugin indent on  -- Enabled by default
-- history                    -- Enabled by default(10000)

-- vim.o.ignorecase = true
-- vim.o.smartcase = true
-- vim.o.incsearch = true
-- vim.o.hlsearch= true
-- vim.o.autochdir=true

-- opt('', '', '')
-- vim.o.tabstop = 4
-- vim.o.shiftwidth = vim.o.tabstop


-- if has('nvim') && !exists('g:fzf_layout')
--   autocmd! FileType fzf
-- endif
-- augroup CocExplorerCustom
-- autocmd!
-- augroup END




