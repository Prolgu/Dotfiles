"============================================="
"============================================="
"                 Nvim-Maps                   "
"============================================="
"============================================="




"================ Mapleader =================="
let mapleader=','

"nnoremap <silent> <F10> :update<Bar>silent ! start %:p<CR>

"nnoremap <F7> :sp<bar>term<cr><c-w>J:resize10<cr>

"********* Help en <F1>  **********"
" map <F1> "zyiw:exe "h ".@z.""<CR>  
inoremap <F1> <nop>

"********* Terminal **********"

nnoremap <F4> :FloatermNew --autoclose=2<CR>

"***************** NerdTree *****************"

nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <F3> :NERDTreeToggle<CR>

"============================================"

noremap  <silent> <F12> <Esc>:FloatermToggle<CR>
noremap! <silent> <F12> <Esc>:FloatermToggle<CR>
tnoremap <silent> <F12> <C-\><C-n>:FloatermToggle<CR>
"************** Guardar y salir *************"

nnoremap <C-s> :w<Cr>
nnoremap <C-x> :q!<Cr>

"============== Buff close =================="

nnoremap q :bd<Cr>
nnoremap Q :q!<Cr>

"============== Indent and move text =============

vnoremap <Left> <gv
vnoremap <Right> >gv
vnoremap <Down> :m '>+1<CR>gv=gv
vnoremap <Up> :m '<-2<CR>gv=gv

"================= Tabs ================="

" nnoremap <S-Tab> :bn <Cr>
" nnoremap <Tab> gt
nnoremap <Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>
"nnoremap <C-Left> :tabprevious<CR>                                                                            
"nnoremap <C-Right> :tabnext<CR>
"nnoremap <silent> <leader>sh :terminal<CR>

"************** SourceF ***************"

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr> 

"********** Directorio de trabajo *********

nnoremap <Leader>. :echo expand('%:p:h')<CR>

"********** Indent guide ************"

nnoremap <leader>ig :call IndentGuides()<cr>

"************* Split ***************"

"noremap <Leader>h :<C-u>split<CR>
"noremap <Leader>v :<C-u>vsplit<CR>
"************** Resize *************"

noremap <C-Up> :resize +2<CR>
noremap <C-Down> :resize -2<CR>
noremap <C-Left> :vertical resize +2<CR>
noremap <C-Right> :vertical resize -2<CR>

"======================== Share Code ========================"
xnoremap <silent> <leader>ss :Share<Cr><Cr> 

"======================= Search Code ========================"

xnoremap <silent> <leader>gg :Go<Cr>
" vnoremap <leader>' gc
" nnoremap <leader>' gc

"==========================================================="

"******* Cambio de ventanas ********

noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"====================== Term/norm-mode =====================" 
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>

"======== Disable arrow keys (helped me learn Vim) ========="

nnoremap <PageUp> <C-u>
nnoremap <PageDown> <C-d>
inoremap <PageUp> <nop>
inoremap <PageDown> <nop>

nmap <up> <nop>
nmap <down> <nop>
nmap <left> :bp<Cr>
nmap <right> :bn<Cr>

" noremap j gj
" noremap k gk


" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>

imap <C-V> "+gP
"map q <nop>

" map <leader>f 
"*********** FzF *************"
map <silent> <C-f> :Files<CR>
nnoremap <leader>b :Buffers<CR>
"nnoremap <leader>g :Files<CR>
"nnoremap <leader>g :Rg<CR>
nnoremap <leader>m :Marks<CR>
nnoremap <leader>l :BLines<Cr>
nnoremap <leader>w :call fzf#vim#files('.', {'options':'--query '.expand('<cword>')})<CR>
" nnoremap <silent> <C-p> :call fzf#vim#files('.', {'options': '--prompt ""'})<CR>
" nnoremap <silent> <C-p> :FZF -m<Cr>
nnoremap <leader>hi :History<CR>
nnoremap <leader>hh :History:<CR>
nnoremap <leader>c :call fzf#vim#commands()<Cr>
"nnoremap <leader>:Rg /usr/share/nvim/runtime/doc/<Cr>

"********** Templates **********"

nnoremap <leader>te :LoadTemplate<Cr>
nnoremap <leader>nb :FZFNeigh<Cr>

"function! SearchWithAgInDirectory(...)
"   call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
"endfunction
"command! -nargs=+ -complete=dir AgIn call SearchWithAgInDirectory(<f-args>)
"
"
"
" choose from templates and apply to file
" Open files in horizontal split
" nnoremap <silent> <Leader>s :call fzf#run({
" \   'down': '40%',
" \   'sink': 'botright split' })<CR>

" Open files in vertical horizontal split
" nnoremap <silent> <Leader>v :call fzf#run({
" \   'right': winwidth('.') / 2,
" \   'sink':  'vertical botright split' })<CR>


function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

" nnoremap <silent> <Leader>. :call fzf#run({
" \   'source':  reverse(<sid>buflist()),
" \   'sink':    function('<sid>bufopen'),
" \   'options': '+m',
" \   'down':    len(<sid>buflist()) + 2
" \ })<CR>

command! FZFMru call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})



