-- Archivo de configuraciones

local user_cmd = vim.api.nvim_create_user_command
local autocmd = vim.api.nvim_create_autocmd
local args = { bang = true }

-- Formatting
vim.o.joinspaces = false
vim.o.shiftround = true
vim.o.showmode = false
vim.o.wrap = false

-- Number + Column
vim.o.signcolumn = 'yes'
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

-- visual utils
vim.o.background = 'dark'
vim.o.wrap = false
vim.o.whichwrap = 'b,s'
vim.o.mouse = 'a'
vim.o.hidden = true
vim.o.termguicolors = true

-- Clipboard
vim.o.clipboard = 'unnamed,unnamedplus'

-- Search opt
vim.o.incsearch = true
vim.o.smartcase = true
vim.o.ignorecase = true

-- Swap, backup, undo
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true
-- vim.o.dictionary:append='~/.config/nvim/dict/dictionary'
vim.o.undolevels = 5000
vim.o.path = '**/*'

-- Menu, Tabs, Etc
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.showtabline = 2
vim.o.showmatch = false
vim.o.sidescroll = 5
vim.o.report = 0
vim.o.shortmess = 'c'
vim.o.helpheight = 20
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.guicursor = 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20'
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldtext = 'CustomFolding()'
vim.o.encoding = 'utf8'
vim.opt.fillchars:append { eob = ' ', fold = ' ' }
-- vim.o.fillchars='fold:\\-'
vim.o.grepprg = 'rg\\ --vimgrep\\ --smart-case\\ --follow'

vim.cmd([[
  set dictionary+=~/.config/nvim/dict/dictionary
  set undodir+=~/.config/nvim/undodir
]])

vim.cmd([[
  set diffopt+=iwhite " No whitespace in vimdiff
  set diffopt+=algorithm:patience
  set diffopt+=indent-heuristic
]])

vim.cmd([[
  highlight Visual guifg=Orange
  highlight! link Visual CursorLine

  highlight link javaIdentifier NONE
  highlight link javaDelimiter NONE

  " ColorColumn
  highlight ColorColumn ctermbg=Gray guibg=Gray
  highlight Comment gui=italic,bold
  highlight VertSplit cterm=NONE

  highlight clear SpellBad
  highlight SpellBad cterm=underline
  " Set style for gVim
  highlight SpellBad gui=undercurl
]])

-- Impide que se agreguen comentarios al crear una nueva linea
-- vim.cmd [[au BufEnter * silent! set fo-=c fo-=r fo-=o]]

-- Aplica templates a ciertos archivos
-- vim.api.nvim_exec([[
--   augroup template
--     au!
--     let g:signature = 'Matias Bonina'
--     autocmd BufNewFile *.* silent! execute '0r $HOME/.config/nvim/templates/'.expand("<afile>:e").'.template'
--     autocmd BufNewFile * %s/{{YEAR}}/\=strftime('%Y')/ge
--     autocmd BufNewFile * %s/{{DATE}}/\=strftime('%a %d %b %Y')/ge
--     autocmd BufNewFile * %s/{{TITLE}}/\=expand('%:t')/ge
--     autocmd BufNewFile * %s/{{NAME}}/\=signature/ge
-- "    autocmd BufNewFile * %s/{{EVAL\s*\([^}]*\)}}/\=eval(submatch(1))/ge
--     autocmd BufNewFile * silent! %s/{{HERE}}/
--   augroup END
-- ]], false)
-- autocmd BufNewFile * %s/{{HERE}}/

vim.cmd [[
   hi SignColumn ctermbg=NONE guibg=NONE
   hi Folded guifg=DarkOrange gui=bold,italic guibg=NONE
   hi Normal ctermbg=NONE guibg=NONE
   hi LineNr ctermbg=NONE guibg=NONE
]]

-- vim.api.nvim_set_hl('')
-- vim.cmd([[command -nargs=* -bar Smake silent make <args> <bar> cwindow]], false)

user_cmd('Smake', 'silent make <args> <bar> cwindow', args)
user_cmd('W', 'w', args)
user_cmd('Wq', 'wq', args)
user_cmd('Ghistory', '0Gclog -- %', args)
user_cmd('Modeline', 'call AppendModeline()', args)
user_cmd('MostrarPDF', 'AsyncRun zathura %<.pdf', args)
user_cmd('MakefileCreate', 'call writefile([\"\' . expand(\'%:t:r\') . \':\"], \"Makefile")', args)

user_cmd('Format', function()
  vim.lsp.buf.format { async = true }
  vim.schedule(function()
    vim.cmd('silent! write')
    print("Buffer formateado")
  end)
end, args)

user_cmd('ToggleQuickFix', function()
  if vim.fn.empty(vim.fn.filter(vim.fn.getwininfo(), "v:val.quickfix")) == 1 then
    vim.cmd([[copen]])
  else
    vim.cmd([[cclose]])
  end
end, args)

user_cmd('Cwd', function()
  local path = vim.fn.expand("%:p:h")
  vim.cmd('lcd' .. path)
  vim.notify(path)
end, args)

user_cmd('Ccwrapper', function()
  vim.cmd([[
   if &colorcolumn
       set colorcolumn=0
   else
       set colorcolumn=+1
       set colorcolumn=80
   endif
  ]])
end, args)

user_cmd('Exportar', function()
  if vim.bo.filetype == "tex" then
    vim.cmd([[
      silent! write
      FloatermNew --autoclose=0 pdflatex %
    ]])
  elseif vim.bo.filetype == "markdown" then
    vim.cmd([[
      silent! write
      FloatermNew --autoclose=0 pandoc % -o %<.pdf
    ]])
  else
    vim.notify("Formato no exportable!")
  end
end, args)

user_cmd("Cppath", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify('Copiado "' .. path .. '" en el portapapeles!')
end, args)

user_cmd("Termy", function()
  vim.cmd([[
    FloatermNew --wintype=normal --width=0.5 --height=0.4 --position=center --autoclose=2 ($SHELL)
  ]])
end, args)


autocmd("TextYankPost", {
  -- group = filetype_commands_group,
  desc = "highlihgt yanking",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
  end,
})

autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[silent! %s/\s\+$//e]],
  -- callback = function()
  --   vim.cmd([[silent! %s/\s\+$//e]])
  -- end,
})

-- Automatically open the quickfix window after executing a grep operation.
autocmd("QuickFixCmdPost", {
  pattern = "grep",
  command = "cwindow",
  -- group = custom_events,
})

autocmd({ "BufWritePre" }, {
  pattern = { "*.lua" },
  callback = function()
    vim.lsp.buf.format { async = false }
  end
})

autocmd({ "BufReadPost" }, {
  pattern = { "*" },
  command = [[ call setpos(".", getpos("'\"")) ]],
})

autocmd({ "InsertEnter" }, {
  pattern = { "*" },
  command = [[ set nornu ]],
})

autocmd({ "BufEnter" }, {
  pattern = { "*" },
  command = [[ silent! set fo-=c fo-=r fo-=o ]],
})

autocmd({ "InsertLeave" }, {
  pattern = { "*" },
  command = [[set rnu]],
})

autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.md" },
  command = [[ setlocal textwidth=80 ]],
})

autocmd({ "FileType" }, {
  pattern = { "help" },
  command = [[ setlocal nonumber ]],
})

autocmd({ "FileType" }, {
  pattern = { "*" },
  command = [[ set formatoptions-=cro ]],
})

autocmd({ "BufReadPost" }, {
  pattern = { "*.rasi" },
  command = [[
    set syntax=css
    set filetype=css
  ]],
})

-- autocmd({ "BufWritePre" }, {
--   pattern = { "*" },
--   -- command = [[
--   --   set syntax=css
--   --   set filetype=css
--   -- ]],
--   callback = function()
--     require("functions").changeheader()
--   end,
-- })

if vim.fn.has("nvim") == 1 then
  autocmd({ "TermOpen" }, {
    pattern = { "*" },
    command = [[
      setlocal nonu nornu
      startinsert
      tnoremap <Esc> <c-\><c-n>
    ]],
  })
  autocmd({ "TermEnter" }, {
    pattern = { "*" },
    command = [[ setlocal  signcolumn=no ]],
  })
  autocmd({ "TermLeave" }, {
    pattern = { "*" },
    command = [[ setlocal  signcolumn=yes ]],
  })
end

if vim.fn.executable("rg") == 1 then
  vim.cmd([[
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
  ]])
end

vim.lsp.buf.code_action({
  only = { "quickfix" },
})
