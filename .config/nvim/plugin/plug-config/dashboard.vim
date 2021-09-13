let g:dashboard_custom_header = [
 \'                                                         ',
 \'   ██████╗ ██████╗  ██████╗ ██╗      ██████╗ ██╗   ██╗',
 \'   ██╔══██╗██╔══██╗██╔═══██╗██║     ██╔════╝ ██║   ██║',
 \'   ██████╔╝██████╔╝██║   ██║██║     ██║  ███╗██║   ██║',
 \'   ██╔═══╝ ██╔══██╗██║   ██║██║     ██║   ██║██║   ██║',
 \'   ██║     ██║  ██║╚██████╔╝███████╗╚██████╔╝╚██████╔╝',
 \'   ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚══════╝ ╚═════╝  ╚═════╝ ',
 \'',
 \]

" Default value is clap
let g:dashboard_default_executive ='fzf'
let g:dashboard_custom_shortcut={
\ 'new_file'           : 'SPC c n',
\ 'last_session'       : 'SPC s l',
\ 'book_marks'         : 'SPC f b',
\ 'find_history'       : 'SPC h h',
\ 'find_file'          : 'SPC f f',
\ 'change_colorscheme' : 'SPC c s',
\ 'find_word'          : 'SPC f a',
\ }
let g:dashboard_fzf_window = 0
let g:dashboard_custom_shortcut_icon={
      \'book_marks': ' ',
      \'last_session': ' ',
      \'find_history' :'ﭯ ',
      \'find_file' : ' ',
      \'new_file' : ' ',
      \'change_colorscheme' : ' ',
      \'find_word' : ' ',
      \}
