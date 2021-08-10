
--******************* TermColor ***************************"
--nvim Term color:
vim.cmd([[
  let g:terminal_color_0  = '#1B1D1E'
  let g:terminal_color_1  = '#EC256D'
  let g:terminal_color_2  = '#00ffff'
  let g:terminal_color_3  = '#FD971F'
  let g:terminal_color_4  = '#458588'
  let g:terminal_color_5  = '#b16286'
  let g:terminal_color_6  = '#536D24'
  let g:terminal_color_7  = '#a89984'
  let g:terminal_color_8  = '#928374'
  let g:terminal_color_9  = '#fb4934'
  let g:terminal_color_10 = '#00df5f'
  let g:terminal_color_11 = '#fabd2f'
  let g:terminal_color_12 = '#00afff'
  let g:terminal_color_13 = '#d3869b'
  let g:terminal_color_14 = '#8ec07c'
  let g:terminal_color_15 = '#ebdbb2'
]])
-- ******************** Floaterm **************************"

-- " Set floating window border line color to cyan, and background to orange
-- " hi FloatermBorder guibg=black guifg=cyan
-- " let g:floaterm_title = 'floaterm ($1|$2)'
-- " let g:floaterm_autoinsert = v:false
-- " let g:floaterm_keymap_new = '<F4>'
-- " let g:floaterm_keymap_prev   = '<F8>'
-- " let g:floaterm_keymap_next   = '<F9>'
-- " let g:floaterm_rootmarkers   = ['.git', '.gitignore', '*.pro', 'Cargo.toml']
-- " hi FloatermNC guibg=skyblue

vim.cmd([[
  hi FloatermBorder guifg=orange
  hi Floaterm guibg=dark
  let g:floaterm_width = 0.6
  let g:floaterm_height = 0.6
  let g:floaterm_position = 'center'
  let g:floaterm_gitcommit = 'split'
  let g:floaterm_autoclose = 0
  let g:floaterm_autohide = v:true
  let g:floaterm_keymap_toggle = '<F12>'
]])
