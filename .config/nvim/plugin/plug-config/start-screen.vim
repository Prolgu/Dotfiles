" vim:foldmethod=marker:fileencoding=utf-8

" Custom banner {{{1 "
let g:startify_custom_header = [
 \ '',
 \ '',
 \ '                                                              ',
 \'               ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
 \'               ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
 \'               ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
 \'               ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
 \'               ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
 \'               ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
 \ '',
 \]

" Lists {{{1 "
let g:startify_lists =[
      \{'type':'files', 'header' : ['           Archivos ']},
      \{'type':'sessions', 'header' : ['        Sesiones ']},
      \{'type':'bookmarks', 'header' : ['       Marcadores ']},
      \{'type':'dir', 'header': ['        Directorio Actual '.getcwd()]},
      \]

" Bookmarks {{{1 "
let g:startify_bookmarks =[
      \ {'c': '~/.config'},
      \ {'i': '~/.config/nvim/init.vim'},
      \ {'z': '~/.zshrc'},
      \ {'d': '~/Develop'},
      \]

" General {{{1 "
let g:startify_session_dir='~/.config/nvim/sessions'
let g:startify_session_autoload =1
let g:startify_session_delete_buffers =1
let g:startify_session_persistence =1
let g:startify_enable_special =0
let g:startify_fortune_use_unicode =1
let g:startify_change_to_vcs_root =1

" '                                                       ',                                                  
" ' ██████╗ ██████╗  ██████╗ ██╗      ██████╗ ██╗   ██╗   ',
" ' ██╔══██╗██╔══██╗██╔═══██╗██║     ██╔════╝ ██║   ██║   ',
" ' ██████╔╝██████╔╝██║   ██║██║     ██║  ███╗██║   ██║   ',
" ' ██╔═══╝ ██╔══██╗██║   ██║██║     ██║   ██║██║   ██║   ',
" ' ██║     ██║  ██║╚██████╔╝███████╗╚██████╔╝╚██████╔╝   ',
" ' ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚══════╝ ╚═════╝  ╚═════╝    ',
" '                                                       ',
