" NOTE: This variable doesn't exist before barbar runs. Create it before
"       setting any option.
" let bufferline = get(g:, 'bufferline', {})

" let bufferline= {}

" " Enable/disable animations
" let bufferline.animation = v:false

" " Enable/disable auto-hiding the tab bar when there is a single buffer
" let bufferline.auto_hide = v:false

" " Enable/disable icons
" " if set to 'numbers', will show buffer index in the tabline
" " if set to 'both', will show buffer index and icons in the tabline
" let bufferline.icons = 'numbers'

" " Configure icons on the bufferline.
" let bufferline.icon_separator_active = '▎'
" let bufferline.icon_separator_inactive = '▎'
" let bufferline.icon_close_tab = ''
" let bufferline.icon_close_tab_modified = '●'

" " Enable/disable close button
" let bufferline.closable = v:false

" " Enables/disable clickable tabs
" "  - left-click: go to buffer
" "  - middle-click: delete buffer
" let bufferline.clickable = v:false

" " If set, the letters for each buffer in buffer-pick mode will be
" " assigned based on their name. Otherwise or in case all letters are
" " already assigned, the behavior is to assign letters in order of
" " usability (see order below)
" let bufferline.semantic_letters = v:true

" " New buffer letters are assigned in this order. This order is
" " optimal for the qwerty keyboard layout but might need adjustement
" " for other layouts.
" let bufferline.letters =
"   \ 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP'

" " Sets the maximum padding width with which to surround each tab
" let bufferline.maximum_padding = 2

" let bg_current= get(nvim_get_hl_by_name('Normal', 1), 'background', '#000000')
" let bg_visible= get(nvim_get_hl_by_name('TabLineSel', 1), 'background', '#000000')
" let bg_inactive = get(nvim_get_hl_by_name('TabLine',   1), 'background', '#000000')

" hi default link BufferCurrent      TabLineSel
" " For the current active buffer when modified
" hi default link BufferCurrentMod   TabLineSel
" " For the current active buffer icon
" hi default link BufferCurrentSign  TabLineSel
" " For the current active buffer target when buffer-picking
" exe 'hi default BufferCurrentTarget   guifg=red gui=bold guibg=' . bg_current

" " For buffers visible but not the current one
" hi default link BufferVisible      Normal
" hi default link BufferVisibleMod   Normal
" hi default link BufferVisibleSign  Normal
" exe 'hi default BufferVisibleTarget   guifg=red gui=bold guibg=' . bg_visible

" " For buffers invisible buffers
" hi default link BufferInactive     TabLine
" hi default link BufferInactiveMod  TabLine
" hi default link BufferInactiveSign TabLine
" exe 'hi default BufferInactiveTarget   guifg=red gui=bold guibg=' . bg_inactive


" " For the shadow in buffer-picking mode
" hi default BufferShadow guifg=#000000 guibg=#000000


