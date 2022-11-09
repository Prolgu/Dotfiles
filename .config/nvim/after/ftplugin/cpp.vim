" vim:fileencoding=utf-8:ft=vim:foldmethod=marker
" CPP-VIM {{{==========================================
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
" =====================================================
set ts=2 sts=2 sw=2 et
set bs=indent,eol,start
" }}}

" Autocompletar {{{====================================

" inoremap <buffer>( ()<Esc>i
" inoremap <buffer>[ []<Esc>i
" inoremap <buffer>' ''<Esc>i
" inoremap <buffer>" ""<Esc>i
" inoremap <buffer>{ {}<Esc>i
" inoremap <buffer>{ {<Cr>}<Esc>O

nnoremap <leader>z $bi('<esc>eli');<esc>o
nnoremap ; $a;<esc>
" nnoremap <space>  i<space><esc>
" nnoremap <silent><F5> :w <Bar> :CppMAKE<Cr>
nnoremap <silent><F6> :w <Bar> :CppCMD<Cr>
" nnoremap <silent><F7> :Format <Bar>:w<Cr>
" nnoremap <silent><F7>  :call Fermento()<Cr>
" =============================================
" au FileType cpp nnoremap <buffer>K :JbzCppMan()<CR>

" function Fermento() abort
"     execute ":Format"
"     execute ":w"
" endfunction

function! s:JbzCppMan()
    let old_isk = &iskeyword
    setl iskeyword+=:
    let str = expand("<cword>")
    let &l:iskeyword = old_isk
    execute 'Man ' . str
endfunction
command! JbzCppMan :call s:JbzCppMan()

nnoremap <silent> <buffer> <F9> :call <SID>compile_run_cpp()<CR>

function! s:compile_run_cpp() abort
  let src_path = expand('%:p:~')
  let src_noext = expand('%:p:~:r')
  " The building flags
  " let _flag = '-Wall -Wextra -std=c++11 -O2'
    let _flag = '-Wall -std=c++17 -O2'

  if executable('clang++')
    let prog = 'clang++'
  elseif executable('g++')
    let prog = 'g++'
  else
    echoerr 'Compilador no encontrado!'
  endif
  call s:create_term_buf('v', 80)
  execute printf('term %s %s %s -o %s && %s', prog, _flag, src_path, src_noext, src_noext)
  startinsert
endfunction

function s:create_term_buf(_type, size) abort
  set splitbelow
  set splitright
  set nonu nornu
  if a:_type ==# 'v'
    vnew
  else
    new
  endif
  execute 'resize ' . a:size
endfunction
" }}}
