" NOTE:

" Share2bin {{{============================

" command! -range=% SP <line1>,<line2>w !curl -F 'sprunge=<-' http://sprunge.us | tr -d '\n' | xclip -i -selection clipboard
command! -range=% CL <line1>,<line2>w !curl -F 'clbin=<-' https://clbin.com | tr -d '\n' | xclip -i -selection clipboard
command! -range=% VP <line1>,<line2>w !curl -F 'text=<-' http://vpaste.net | tr -d '\n' | xclip -i -selection clipboard
command! -range=% PB <line1>,<line2>w !curl -F 'c=@-' https://ptpb.pw/?u=1 | tr -d '\n' | xclip -i -selection clipboard
command! -range=% IX <line1>,<line2>w !curl -F 'f:1=<-' http://ix.io | tr -d '\n' | xclip -i -selection clipboard
command! -range=% EN <line1>,<line2>w !curl -F 'file=@-;' https://envs.sh | tr -d '\n' | xclip -i -selection clipboard
command! -range=% TB <line1>,<line2>w !nc termbin.com 9999 | tr -d '\n' | xclip -i -selection clipboard
command! -range=% SP <line1>,<line2>w !curl -F 'sprunge=<-' http://sprunge.us | tr -d '\n' | xargs firefox

" }}}

" Floaterm {{{=============================

" Terminales para lenguajes(<F5>)
" silent command! PyCMD  :FloatermNew --wintype=normal --width=0.5 --height=0.4 --position=center (python %)
" silent command! JsCMD  :FloatermNew --wintype=normal --width=0.5 --height=0.4 --position=center (node %)
" silent command! LuaCMD :FloatermNew --wintype=normal --width=0.5 --height=0.4 --position=center (lua %)
" silent command! ShCMD  :FloatermNew --wintype=normal --width=0.5 --height=0.4 --position=center (bash %)
" silent command! CCMD   :FloatermNew --wintype=normal --width=0.5 --height=0.4 --position=center (clear && gcc % -o %< && ./%<)
" silent command! CppCMD :FloatermNew --wintype=top --width=200 --height=200 --position=center (clear && g++ % -o %< && ./%<)
" silent command! CppMAKE :FloatermNew --wintype=normal --width=0.5 --height=0.4 --position=center (g++ % -o %<)
" silent command! RustCMD :FloatermNew --wintype=normal --width=0.5 --height=0.4 --position=center (clear && rustc % && ./%<)
" silent command! ClCMD  :FloatermNew --wintype=normal --width=0.5 --height=0.4 --position=center (clisp %)

silent command! CargoRun :w <Bar> FloatermNew --wintype=normal --width=0.5 --height=0.4 --position=center (cargo run)
silent command! CargoCheck :w <Bar> FloatermNew --wintype=normal --width=0.5 --height=0.4 --position=center (cargo check)
silent command! CargoBuild :w <Bar> FloatermNew --wintype=normal --width=0.5 --height=0.4 --position=center (cargo build)

" }}}

" modelines {{{=======================================

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
" function! AppendModeline()
"   let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
"         \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
"   let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
"   call append(line("$"), l:modeline)
" endfunction


" }}}


" Local TODO {{{

" function! ToggleQuickFix()
"   if empty(filter(getwininfo(), 'v:val.quickfix'))
"     copen
"   else
"     cclose
"   endif
" endfunction

" command! -bar LTODO :vimgrep /\v\CTODO|FIXME|HACK|NOTE|DEV/g % <Cr> <bar> :copen
" function! ToggleQuickFix()
"   if exists("g:qwindow")
"     lclose
"     unlet g:qwindow
"   else
"     try
"       lopen 10
"       let g:qwindow = 1
"     catch
"       echo "No Errors found!"
"     endtry
"   endif
" endfunction

" nnoremap <silent> <F3> :TodoQuickFix<cr>
" nnoremap <silent> <F3> :TodoQuickFix<cr><bar>call ToggleQuickFix()<cr>

"}}}

" default
" +--  7 lines: set foldmethod=indent··············
"
" new
" ⏤⏤⏤⏤► [7 lines]: set foldmethod=indent ⏤⏤⏤⏤⏤⏤⏤⏤⏤⏤
"
" Folding {{{=========================================

function! CustomFolding() abort
  let l:start_arrow = '--> '
  let l:lines='[' . (v:foldend - v:foldstart + 1) . ' lines]'
  let l:first_line=substitute(getline(v:foldstart), '\v *', '', '')
  return l:start_arrow . l:lines . ': ' . l:first_line . ' '
endfunction

" set foldtext=CustomFolding()

" }}}


lua require('plugin')
lua require('init')
lua require('maps')
lua require('options')
lua require('functions')
