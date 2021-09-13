-- Mapping ================================


-- Definiciones {{{ =======

local opts = {noremap = true, silent = true}
local vmp=vim.api.nvim_set_keymap

-- Set my leader key to ','
vim.cmd('let mapleader=","')

--}}}



-- Function Key {{{=========================================

-- Cancel <F1> on Insert Mode
vmp('i', '<F1>', '<nop>', opts)
-- Paste Toggle
vmp('n', '<F2>', ':set paste!<bar>:set paste?<Cr>', opts)
-- Termy(Terminal Open)
vmp('n', '<F4>', ':Termy<Cr>', opts)
vmp('i', '<F4>', '<Esc>:Termy<Cr>', opts)

--}}}

-- Delete/VSelect {{{=========================================

-- Delete to Black Hole
vmp('n', 'x', '"_x', opts)
vmp('n', 'X', '"_x', opts)
-- Dont lose VSelect
-- vmp('v', 'y', 'ygv<Esc>', opts)

--}}}

-- Folding {{{=========================================

-- Folding Line
vmp('n', '<space>', 'za', opts)
-- Folding Dcocument
vmp('n', '<leader><space>', 'zi', opts)
-- vmp('n', '<leader><space>' , 'zR',opts)
-- Moving between folds
vmp('n', '<PageUp>', 'zk',opts)
vmp('n', '<PageDown>', 'zj',opts)

--}}}

-- Tabs {{{=========================================

-- Tab New
vmp('n', '<S-t>', ':tabnew<Cr>', opts)
-- Tab Mov
vmp('n', '<Left>', ':tabNext<Cr>',opts)
vmp('n', '<Right>', ':tabprev<Cr>',opts)

--}}}

-- Text mov {{{=========================================

-- Left/Right
vmp('v', '<S-Left>', '<gv', opts)
vmp('v', '<S-Right>', '>gv', opts)
-- vmp('v', 'H', '<gv', opts)
-- vmp('v', 'L', '>gv', opts)

-- Up/Down
vmp('v', '<S-Up>', ':m \'<-2<CR>gv=gv', opts)
vmp('v', '<S-Down>', ':m \'>+1<CR>gv=gv', opts)
-- vmp('v', 'K', ':m \'<-2<CR>gv=gv', opts)
-- vmp('v', 'J', ':m \'>+1<CR>gv=gv', opts)

--}}}

-- Resize {{{=========================================

vmp('n', '<C-Up>', ':resize +2<CR>',opts)
vmp('n', '<C-Down>', ':resize -2<CR>',opts)
vmp('n', '<C-Right>', ':vertical resize +2<CR>',opts)
vmp('n', '<C-Left>', ':vertical resize -2<CR>',opts)

--}}}

-- Search {{{=========================================

vmp('n', '<leader>/', '*',opts)

-- Search Next
vmp('n', 'n', 'nzzzv', opts)

-- Search Prev
vmp('n', 'N', 'Nzzzv', opts)

-- Go Definition
vmp('n', 'g*', 'g*zz', opts)
vmp('n', 'g#', 'g#zz', opts)

--}}}

-- Cursorcolumn {{{=========================================

vmp('n', '<leader>tc', ':set cursorcolumn!<bar>:set cursorcolumn?<Cr>', opts)

--}}}

-- Nop {{{=========================================

vmp('n', '<Up>', '<nop>',opts)
vmp('n', '<Down>', '<nop>',opts)
vmp('i', '<PageUp>', '<nop>',opts)
vmp('i', '<PageDown>', '<nop>',opts)

vmp('n', 'Q', '<nop>', opts)

--}}}

-- Path {{{=========================================

vmp('n', '<leader>.', ':echo expand(\'%:p:h\')<Cr>', opts)

--}}}

-- UndoTree {{{=========================================

vmp('n', '<leader>ut', ':MundoToggle<Cr>', opts)

--}}}

-- Pastebin/Google {{{=========================================

-- Pastebin Share
vmp('x', '<leader>ss', ':Share<Cr><Cr>', opts)
-- Google Search
vmp('v', '<leader>gg', ':Go<Cr>', opts)

--}}}

-- IndentGuides {{{=========================================

vmp('n', '<leader>ig', ':call IndentGuides()<Cr>', opts)

--}}}

-- Splits {{{=========================================

vmp('n', '<leader>hs', ':<C-u>split<CR>', opts)
vmp('n', '<leader>vs', ':<C-u>vsplit<CR>', opts)

--}}}

-- FzF {{{=========================================

-- Files
vmp('n', '<leader>p', ':Files<Cr>', opts)
-- Buffers/Line
vmp('n', '<leader>bb', ':Buffers<Cr>',opts)
vmp('n', '<tab>', ':Buffers<Cr>',opts)
vmp('n', '<leader>bl', ':BLines<Cr>', opts)
-- Marks
vmp('n', '<leader>mk', ':Marks<Cr>', opts)
-- Maps
vmp('n', '<leader>mm', ':Maps<Cr>', opts)
-- History
vmp('n', '<leader>hh', ':History<Cr>', opts)
-- History :
vmp('n', '<leader>hc', ':History:<Cr>', opts)
-- History /
vmp('n', '<leader>hb', ':History/<Cr>', opts)
-- Commands
vmp('n', '<leader>cl', ':call fzf#vim#commands()<Cr>', opts)
-- Filetypes
vmp('n', '<leader>ft', ':Filetypes<Cr>', opts)

-- LS
vmp('n', '<leader>ls', ':LS<Cr>', opts)

--}}}

-- $VIMRC {{{=========================================

vmp('n', '<leader>ev', ':tabnew $MYVIMRC<cr>', opts)
vmp('n', '<leader>sv', ':source $MYVIMRC<cr>', opts)

--}}}

-- Salto de linea {{{=========================================

vmp('n', '<leader>o', 'm`O<Esc>``', opts)

--}}}

-- Buffer {{{=========================================

-- Buffer Pick
vmp('n', '<leader>bp', ':BufferLinePick<Cr>',opts)
-- Buffer Close
vmp('n', '<leader>bc', ':bufdo bd! #<Cr>', opts)
-- Buffer New
vmp('n', '<leader>bn', ':enew<Cr>', opts)
-- Buffer Destroy
vmp('n', '<leader>bd', ':bd<Cr>', opts)

--}}}

-- Close/Save {{{=========================================

-- Save/all
vmp('n', '<leader>ww', ':w!<Cr>', opts)
vmp('n', '<leader>wq', ':wq!<Cr>', opts)
vmp('n', '<leader>wa', ':wa!<Cr>', opts)
-- Forced Close 
vmp('n', '<leader>qd', ':bd!<Cr>', opts)
vmp('n', '<leader>qq', ':q!<Cr>', opts)
-- Close all
vmp('n', '<leader>qa', ':qa!<Cr>', opts)
-- Close Help
vmp('n', '<leader>qh', ':helpclose<Cr>', opts)

--}}}

-- No Highlight {{{=========================================

vmp('n', '<leader>nh', ':noh<Cr>', opts)

--}}}

-- Movement {{{=========================================

-- Classical
vmp('n', 'j', 'gj', opts)
vmp('n', 'k', 'gk', opts)
-- Between Buffers
vmp('n', '<C-j>', '<C-w>j', opts)
vmp('n', '<C-k>', '<C-w>k', opts)
vmp('n', '<C-l>', '<C-w>l', opts)
vmp('n', '<C-h>', '<C-w>h', opts)

--}}}

-- Paste insert C+V {{{=========================================
vmp('i', '<C-v>', '<Esc>"+gPi', opts)
vmp('n', '<leader>yw', 'yiw', opts)

--}}}

-- Insercion Especial {{{=========================================

vmp('i', '~n', 'ñ', opts)

--}}}

-- Term {{{=========================================

vmp('t', '<Esc>', '<C-\\><C-n>', opts)
vmp('t', ':q!', '<C-\\><C-n>:q!<Cr>', opts)

--}}}

-- Coc-Format {{{=========================================

vmp('n', '<leader>fo', ':Format<Cr>', opts)

--}}}

-- vmp('v', ';', ':', opts)
-- vmp('n', ';', ':', opts)

vmp('n', '<leader>bq', ':w <bar> :bd<Cr>', opts)







-- Unused {{{

-- Set mappings  ('Mode', 'Key', 'Accion', Opts)
-- Mode: i=insert, v=visual, n=normal
-- accion = comand to execute by mappings
-- Key= mapping key
-- opts = noremap and silent
-- Eg: vim.api.nvim_set_keymap('n', '<leader>p', ':echo "Hello World!"<Cr>', opts)


-- vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', opts)

-- vim.api.nvim_command('command! TSRehighlight :write | edit | TSBufEnable highlight')
-- vim.cmd('au FileType cpp ia <buffer> itn int')


-- local function map(mode, lhs, rhs, opts)
--   local options = {noremap = true,silent=true}
--   if opts then options = vim.tbl_extend('force', options, opts) end
--   vim.api.nvim_set_keymap(mode, lhs, rhs, options)
-- end


-- map('', '<leader>c', '"+y')       -- Copy to clipboard in normal, visual, select and operator modes
-- map('i', '<C-u>', '<C-g>u<C-u>')  -- Make <C-u> undo-friendly
-- map('i', '<C-w>', '<C-g>u<C-w>')  -- Make <C-w> undo-friendly

-- -- <Tab> to navigate the completion menu
-- map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
-- map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

-- map('n', '<C-l>', '<cmd>noh<CR>')    -- Clear highlights
-- map('n', '<leader>o', 'm`o<Esc>``')  -- Insert a newline in normal mode

--vmp('n', '<leader>', '', opts)
--vmp('n', '<leader>', '', opts)
--vmp('n', '<leader>', '', opts)
--vmp('n', '<leader>', '', opts)
--vmp('n', '<leader>', '', opts)
--vmp('n', '<leader>', '', opts)
--vmp('n', '<leader>', '', opts)
--vmp('n', '<leader>', '', opts)
-- vmp('n', '<leader>pp', ':echo "asd"<Cr>',opts)

-- vim.api.nvim_set_keymap('n', '<space><space>', 'i<space><esc>',opts)

-- vim.api.nvim_set_keymap('n', '<Leader>n', ':noh<CR>', opts)
-- vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', opts)
--vmp('n', '', '',opts)
--}}}


-- vim:fileencoding=utf-8:ft=lua:foldmethod=marker
