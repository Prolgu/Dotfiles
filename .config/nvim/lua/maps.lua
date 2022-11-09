-- Mapping ================================

-- Definiciones {{{ =======

local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

-- Set my leader key to ','
-- vim.cmd('let mapleader=","')
vim.g.mapleader = ","
--}}}


-- function smart_dd()
--   if vim.api.nvim_get_current_line():match("^%s*$") then
--     return "\"_dd"
--   else
--     return "dd"
--   end
-- end
local function delete_special()
  local line_data = vim.api.nvim_win_get_cursor(0) -- returns {row, col}
  local current_line = vim.api.nvim_buf_get_lines(0, line_data[1] - 1, line_data[1], false)
  if current_line[1] == "" then
    return '"_dd'
  else
    return 'dd'
  end
end

local function smart_d()
  local l, c = unpack(vim.api.nvim_win_get_cursor(0))
  for _, line in ipairs(vim.api.nvim_buf_get_lines(0, l - 1, l, true)) do
    if line:match("^%s*$") then
      return "\"_d"
    end
  end
  return "d"
end

vim.keymap.set("n", "dd", delete_special, { noremap = true, expr = true })
vim.keymap.set("v", "d", smart_d, { noremap = true, expr = true })

-- Function Key {{{=========================================

-- Cancel <F1> on Insert Mode
map('i', '<F1>', '<nop>', opts)
-- Paste Toggle
map('n', '<F2>', ':set paste!<bar>:set paste?<Cr>', opts)
-- Termy(Terminal Open)
map('n', '<F4>', ':Termy<Cr>', opts)
map('i', '<F4>', '<Esc>:Termy<Cr>', opts)

--}}}

-- Delete/VSelect {{{=========================================

-- Delete to Black Hole
-- map('n', 'x', '"_x', opts)
map('n', 'X', '"_x', opts)
-- Dont lose VSelect
-- map('v', 'y', 'ygv<Esc>', opts)

--}}}

-- Folding {{{=========================================

-- Folding Line
map('n', '<space>', 'za', opts)
-- Folding Document
map('n', '<leader><space>', 'zi', opts)
-- map('n', '<leader><space>' , 'zR',opts)
-- Moving between folds
map('n', '<PageUp>', 'zk', opts)
map('n', '<PageDown>', 'zj', opts)

--}}}

-- Tabs {{{=========================================

-- Tab New
map('n', '<S-t>', ':tabnew<Cr>', opts)
-- Tab Mov
-- map('n', '<Left>', ':tabNext<Cr>',opts)
-- map('n', '<Right>', ':tabprev<Cr>',opts)
map('n', '<Left>', ':BufferLineCyclePrev<Cr>', opts)
map('n', '<Right>', ':BufferLineCycleNext<Cr>', opts)

--}}}

-- Text mov {{{=========================================

-- Left/Right
map('v', '<S-Left>', '<gv', opts)
map('v', '<S-Right>', '>gv', opts)
-- map('v', 'H', '<gv', opts)
-- map('v', 'L', '>gv', opts)

-- Up/Down
map('v', '<S-Up>', ':m \'<-2<CR>gv=gv', opts)
map('v', '<S-Down>', ':m \'>+1<CR>gv=gv', opts)
-- map('v', 'K', ':m \'<-2<CR>gv=gv', opts)
-- map('v', 'J', ':m \'>+1<CR>gv=gv', opts)

map('n', 'G', 'Gzz', opts)
--}}}

-- Resize {{{=========================================

map('n', '<C-Up>', ':resize +2<CR>', opts)
map('n', '<C-Down>', ':resize -2<CR>', opts)
map('n', '<C-Right>', ':vertical resize +2<CR>', opts)
map('n', '<C-Left>', ':vertical resize -2<CR>', opts)

--}}}

-- Search {{{=========================================

map('n', '<leader>/', '*', opts)

-- Search Next
map('n', 'n', 'nzzzv', opts)

-- Search Prev
map('n', 'N', 'Nzzzv', opts)

-- Go Definition
-- map('n', 'g*', 'g*zz', opts)
-- map('n', 'g#', 'g#zz', opts)

--}}}

-- Cursorcolumn {{{=========================================

map('n', '<leader>cc', ':set cursorcolumn!<bar>:set cursorcolumn?<Cr>', opts)
map('n', '<leader>cw', ':Ccwrapper<Cr>', opts)


--}}}

-- Nop {{{=========================================

map('n', '<Up>', '<nop>', opts)
map('n', '<Down>', '<nop>', opts)
map('i', '<PageUp>', '<nop>', opts)
map('i', '<PageDown>', '<nop>', opts)

-- map('n', '<q:>', '<nop>', opts)
map('n', 'q:', '<nop>', opts)
map('n', 'Q', '<nop>', opts)

--}}}

-- Path {{{=========================================

map('n', '<leader>.', ':pwd<Cr>', opts)
map('n', '<leader>cd', ':Cwd<Cr>', opts)

--}}}

-- UndoTree {{{=========================================

-- map('n', '<leader>ut', ':MundoToggle<Cr>', opts)

--}}}

-- Pastebin/Google {{{=========================================

-- Pastebin Share
map('x', '<leader>ss', ':Share<Cr><Cr>', opts)
-- Google Search
-- map('v', '<leader>gg', ':Go<Cr>', opts)

--}}}

-- IndentGuides {{{=========================================

-- map('n', '<leader>ig', ':call IndentGuides()<Cr>', opts)
map('n', '==', 'gg=G', opts)

--}}}

-- Splits {{{=========================================

map('n', '<leader>sp', ':<C-u>split<CR>', opts)
map('n', '<leader>vs', ':<C-u>vsplit<CR>', opts)

--}}}

-- Telescope {{{=========================================

-- Files
map('n', '<leader>ff', ':Telescope find_files<Cr>', opts)
-- Buffers/Line
map('n', '<leader>bb', ':Telescope buffers<Cr>', opts)
map('n', '<tab>', ':Telescope buffers<Cr>', opts)
map('n', '<leader>bl', ':Telescope current_buffer_fuzzy_find<Cr>', opts)
-- Marks
map('n', '<leader>mk', ':Telescope marks<Cr>', opts)
-- Maps
map('n', '<leader>mm', ':Telescope keymaps<Cr>', opts)
-- History
map('n', '<leader>hh', ':Telescope oldfiles<Cr>', opts)
-- History :
map('n', '<leader>hc', ':Telescope command_history<Cr>', opts)
-- History /
map('n', '<leader>hb', ':Telescope search_history<Cr>', opts)
-- Commands
map('n', '<leader>co', ':Telescope commands<Cr>', opts)
-- Filetypes
map('n', '<leader>ft', ':Telescope filetypes<Cr>', opts)
-- RipGrep
map('n', '<leader>rg', ':Telescope live_grep<Cr>', opts)
-- map('n', '<leader>lg', function()
--   require("telescope.builtin").live_grep({ grep_open_files = true })
-- end)
-- Todo
map('n', '<leader>td', ':TodoTelescope<Cr>', opts)
-- LS
-- map('n', '<leader>ls', ':LS<Cr>', opts)

--}}}

-- NvimTree{{{=========================================
map('n', '<S-Tab>', ':NvimTreeFindFileToggle<Cr>', opts)
-- map('n', '<C-Tab>', ':NvimTreeToggle<Cr>', opts)
--}}}

-- $VIMRC {{{=========================================

map('n', '<leader>ev', ':tabnew $MYVIMRC<cr>', opts)
map('n', '<leader>sv', ':source $MYVIMRC<cr>', opts)

--}}}

-- Salto de linea {{{=========================================

map('n', '<leader>o', 'm`O<Esc>``', opts)

--}}}

-- Buffer {{{=========================================

-- Buffer Pick
map('n', '<leader>bp', ':BufferLinePick<Cr>', opts)
-- Buffer Close
map('n', '<leader>bc', ':bufdo bd! #<Cr>', opts)
-- Buffer New
map('n', '<leader>bn', ':enew<Cr>', opts)
-- Buffer Destroy
map('n', '<leader>bd', ':bd<Cr>', opts)
-- Buffer Save + Destro
map('n', '<leader>bq', ':w <bar> :bd<Cr>', opts)
-- Buffer Movement
-- map('n', '<C-[>', ':BufferLineCyclePrev<Cr>', opts)
-- map('n', '<C-]>', ':BufferLineCycleNext<Cr>', opts)

--}}}

-- Close/Save {{{=========================================

-- Save/all
map('n', '<leader>ww', ':w!<Cr>', opts)
map('n', '<leader>wq', ':wq!<Cr>', opts)
map('n', '<leader>wa', ':wa!<Cr>', opts)
-- Forced Close
map('n', '<leader>qd', ':bd!<Cr>', opts)
map('n', '<leader>qq', ':q!<Cr>', opts)
-- Close all
map('n', '<leader>qa', ':qa!<Cr>', opts)
-- Close Help
map('n', '<leader>qh', ':helpclose<Cr>', opts)

--}}}

-- No Highlight {{{=========================================

-- map('n', '<leader>nh', ':noh<Cr>', opts)
map('n', '<leader>nh', ':ClearSearch<Cr>', opts)
-- map('n', '<leader>nh', ':set invhlsearch<Cr>', opts)
-- map('n', '<leader>nh', ':set highlight!<Cr>', opts)

--}}}

-- Movement {{{=========================================

-- Classical
map('n', 'j', 'gj', opts)
map('n', 'k', 'gk', opts)
-- Between Buffers
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<C-h>', '<C-w>h', opts)

--}}}

-- Paste insert C+V {{{=========================================
map('i', '<C-v>', '<Esc>"+gPi', opts)
map('n', '<leader>yw', 'yiw', opts)

--}}}

-- Insercion Especial {{{=========================================

map('i', '~n', 'ñ', opts)

--}}}

-- Term {{{=========================================

map('t', '<Esc>', '<C-\\><C-n>', opts)
map('t', ':q!', '<C-\\><C-n>:q!<Cr>', opts)

--}}}

-- Visual  {{{=========================================

map('n', '<leader>a', 'ggVG', opts)

-- }}}

-- DB manage  {{{=========================================

map('n', '<leader>db', ':DBUIToggle<Cr>', opts)

-- }}}

-- LSP  {{{=========================================

map('n', 'fo', "<cmd>lua vim.lsp.buf.format {async=true}<CR>", opts)
map('v', 'rn', "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
map('n', '<leader>rn', "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
-- map('n','<leader>gd',"<cmd>lua vim.lsp.buf.definition()<CR>",opts)
map('v', 'gd', "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
map('v', 'gD', "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
map('v', 'gi', "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map('n', 'gr', "<cmd>lua vim.lsp.buf.references()<CR>", opts)
map('n', '<leader>ca', "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

-- }}}

-- Runner  {{{=========================================

map('n', '<F5>', '<cmd>Run<Cr>', opts)

-- }}}

-- map('n', '<Leader><CR>', ':AsyncRun $TERM &<CR>', opts)
map('n', '<Leader><CR>', ':!echo \"pepex\" <CR>', opts)
-- map('v', ';', ':', opts)
-- map('n', ';', ':', opts)








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

--map('n', '<leader>', '', opts)
--map('n', '<leader>', '', opts)
--map('n', '<leader>', '', opts)
--map('n', '<leader>', '', opts)
--map('n', '<leader>', '', opts)
--map('n', '<leader>', '', opts)
--map('n', '<leader>', '', opts)
--map('n', '<leader>', '', opts)
-- map('n', '<leader>pp', ':echo "asd"<Cr>',opts)

-- vim.api.nvim_set_keymap('n', '<space><space>', 'i<space><esc>',opts)

-- vim.api.nvim_set_keymap('n', '<Leader>n', ':noh<CR>', opts)
-- vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', opts)
--map('n', '', '',opts)
-- Coc-Format {{{=========================================

-- map('n', '<leader>fo', ':Format<Cr>', opts)

--}}}
--}}}


-- vim:fileencoding=utf-8:ft=lua:foldmethod=marker
