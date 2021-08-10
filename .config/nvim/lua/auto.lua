
-- MayBlock is esc
vim.api.nvim_command([[
  au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
  au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
]])

-- Remember line position
vim.api.nvim_command([[
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
]])

-- coc-explorer nornu
vim.api.nvim_command([[
  autocmd FileType coc-explorer setlocal norelativenumber
  autocmd BufEnter coc-explorer if &ft == 'coc-explorer'| call CocAction('runCommand', 'explorer.doAction', 'closest', ['refresh']) | endif
]])

-- vimrc sync fromstart
vim.api.nvim_command([[
  autocmd Bufenter * :syntax sync maxlines=80
]])

-- floaterm
vim.api.nvim_command([[
  autocmd FileType floaterm setlocal nocul nornu nonu noru
  autocmd FileType help setlocal number
  autocmd FileType * set formatoptions-=cro
]])



-- noru,nornu on fzf
vim.api.nvim_command([[
    autocmd  FileType fzf set nornu noruler | autocmd BufLeave <buffer> set rnu ruler
]])



-- vim.api.nvim_command([[

-- ]])

vim.cmd([[

  highlight VertSplit cterm=NONE
  hi CursorLine cterm=NONE term=NONE  ctermbg=NONE 
  highlight CursorLineNR ctermbg=Cyan ctermfg=Black cterm=bold 
  highlight LineNr ctermfg=white  cterm=bold 
  hi Normal ctermbg=NONE 

  let g:netrw_banner=0
  let loaded_matchit = 1
  let g:molokai_original = 1 

  let g:vim_g_command = "Go"
  let g:vim_g_f_command = "Gfi"
  let g:vim_g_query_url = "http://google.com/search?q="
  let g:vim_g_open_command = "xdg-open"

  let g:python3_host_prog=expand('/usr/bin/python3')
  let g:loaded_node_provider = 1

]])
