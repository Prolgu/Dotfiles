
"******** Indent *********"
let g:indentguides_state = 0
function! IndentGuides() abort
    if g:indentguides_state
        let g:indentguides_state = 0
        2match None
    else
        let g:indentguides_state = 1
        execute '2match IndentGuides /\%(\_^\s*\)\@<=\%(\%'.(0*&sw+1).'v\|\%'.(1*&sw+1).'v\|\%'.(2*&sw+1).'v\|\%'.(3*&sw+1).'v\|\%'.(4*&sw+1).'v\|\%'.(5*&sw+1).'v\|\%'.(6*&sw+1).'v\|\%'.(7*&sw+1).'v\)\s/'
    endif
endfunction
hi def IndentGuides guibg=#303030

"*******************************"

function! Term() abort
    set splitbelow
    exec winheight(0)/4."split"|:w | terminal $SHELL
    "exec "vsp" | terminal $SHELL %
    set nonumber
    set norelativenumber
    set signcolumn=no
    startinsert!
endfunction

"************* ToggleTerm *************"
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height) abort
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf 
        catch
            call termopen('$SHELL', {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction


"******* Templates ********

function! s:read_template_into_buffer(template) abort
	" has to be a function to avoid the extra space fzf#run insers otherwise
	execute '0r ~/.vimtemplates/'.a:template
endfunction

command! -bang -nargs=* LoadTemplate call fzf#run({
			\   'source': 'ls -1 ~/.vimtemplates',
			\   'down': 15,
			\   'sink': function('<sid>read_template_into_buffer'),
            \   'window': { 'width': 0.2, 'height': 0.3,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } })


function! s:fzf_neighbouring_files() abort
  let current_file =expand("%")
  let cwd = fnamemodify(current_file, ':p:h')
  let command = 'ag -g "" -f ' . cwd . ' --depth 0'
  let shape =   { 'width': 0.4, 'height': 0.3,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } 
  call fzf#run({
        \ 'source': command,
        \ 'sink':   'e',
        \ 'options': '-m -x +s',
        \ 'window': shape})
endfunction

command! FZFNeigh call s:fzf_neighbouring_files()

"************** OLD *****************"

function! Templates(key) abort
let numt ={
            \"1":"~/.vimtemplates/py.template",
            \"2":"~/.vimtemplates/sh.template",
            \"3":"~/.vimtemplates/c.template",
            \"4":"~/.vimtemplates/cpp.template",
            \"5":"~/.vimtemplates/html.template",
            \}

     exec "0r".get(numt,a:key)
endfunction


