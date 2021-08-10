"========================================"
"               FZF-VIM                  "
"========================================"

" This is the default extra key bindings
" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-x': 'split',
"   \ 'ctrl-v': 'vsplit' }
 
let g:fzf_action = {
   \ 'return': 'GotoOrOpen tab',
   \ 'ctrl-x': 'split',
   \ 'ctrl-v': 'vsplit' }

" let g:fzf_action = {
"   \ 'return': 'tab split',
"   \ 'ctrl-x': 'split',
"   \ 'ctrl-v': 'vsplit' }

let g:fzf_buffers_jump = 1
let g:fzf_use_term=1 

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_tags_command = 'ctags -R'
" Border color
" let g:fzf_layout = {'up':'~80%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'rounded' } }
let g:fzf_layout = {'down':'~50%'}


let $FZF_DEFAULT_OPTS = '--layout=reverse-list --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

" Customize fzf colors to match your color scheme
let g:fzf_colors ={
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'NONE'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


function! s:GotoOrOpen(command, ...)
  for file in a:000
    if a:command == 'e'
      exec 'e ' . file
    else
      exec "tab drop " . file
    endif
  endfor
endfunction
 
command! -nargs=+ GotoOrOpen call s:GotoOrOpen(<f-args>)

" Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse-list', '--info=inline'],'down':15}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)


command! -bang PFiles call fzf#run({
            \'source':'ls -a ~/Documentos',
            \'down':10,
            \'window':{ 'width': 0.4, 'height': 0.3,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' }})

" nnoremap <silent> <C-p> :call fzf#run({
"             \'source':'ls -a ~/Documentos',
"             \'options': ['--layout=reverse-list', '--info=inline'],
"             \'down':10,})<Cr>

command! -bang LS call fzf#run(fzf#wrap({
            \'source': 'exa -lhSa',
            \'options': ['--layout=reverse-list', '--info=inline'],
            \'down':15,
            \}, <bang>0))


function! s:read_template_into_buffer(template) abort
	" has to be a function to avoid the extra space fzf#run insers otherwise
	execute '0r ~/.vimtemplates/'.a:template
endfunction

" command! -bang -nargs=* LoadTemplate call fzf#run({
" 			\   'source': 'ls ~/.vimtemplates',
" 			\   'down': 15,
" 			\   'sink': function('<sid>read_template_into_buffer'),
"       \   'window': { 'width': 0.2, 'height': 0.3,'yoffset':0.0,'xoffset': 0.0, 'highlight': 'Todo', 'border': 'sharp' } })

nnoremap <silent> <leader>tt :call fzf#run({
			\   'source': 'ls ~/.vimtemplates',
			\   'down': 10,
			\   'sink': function('<sid>read_template_into_buffer'), })<Cr>

command! FZFL FloatermNew fzf

" nnoremap <silent> <tab> :call fzf#vim#windows({'down':10})<Cr> 

" command! -bang DevFiles call fzf#vim#files('~/Develop', <bang>0)

" Jump to tab: <Leader>t
function TabName(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    return fnamemodify(bufname(buflist[winnr - 1]), ':t')
endfunction

function! s:jumpToTab(line)
    let pair = split(a:line, ' ')
    let cmd = pair[0].'gt'
    execute 'normal' cmd
endfunction

" nnoremap <silent> <tab> :call fzf#run({
"           \   'source':  reverse(map(range(1, tabpagenr('$')), 'v:val." "." ".TabName(v:val)')),
"           \   'sink':    function('<sid>jumpToTab'),
"           \   'down':    tabpagenr('$') + 2
"           \ })<CR>




" inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})

" inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
"   \ 'prefix': '^.*$',
"   \ 'source': 'rg -n ^ --color always',
"   \ 'options': '--ansi --delimiter : --nth 3..',
"   \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))
