"********** Mapleader ***********"
let mapleader=','

"*********** Mapeo *************

"************ Corrector  ************"
nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>

"nnoremap <silent> <F10> :update<Bar>silent ! start %:p<CR>

"nnoremap <F7> :sp<bar>term<cr><c-w>J:resize10<cr>

"********* Terminal **********"

nnoremap <F4> :FloatermNew --autoclose=2<CR>

"********* NerdTree ***********"

nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <F3> :NERDTreeToggle<CR>

"*********** Guardar y salir *******

nnoremap <C-s> :w<Cr>
nnoremap <C-x> :q!<Cr>
"********* Buff close ***********"
nnoremap q :bd<Cr>
"************* Tabs *************"

nnoremap <S-Tab> :bn <Cr>
"nnoremap <Tab> gt
nnoremap <Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>
"nnoremap <C-Left> :tabprevious<CR>                                                                            
"nnoremap <C-Right> :tabnext<CR>


"********** Templates **********"

nmap <Leader>1 :call Templates(1)<Cr> 
nmap <Leader>2 :call Templates(2)<Cr>
nmap <Leader>3 :call Templates(3)<Cr>
nmap <Leader>4 :call Templates(4)<Cr>
nmap <leader>5 :call Templates(5)<Cr>


"emulacion de terminal
"nnoremap <silent> <leader>sh :terminal<CR>

"************** SourceF ***************"

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr> 


"********** Directorio de trabajo *********

nnoremap <Leader>. :echo expand('%:p:h')<CR>
"********** Indent guide ************"

nnoremap <leader>n :call IndentGuides()<cr>

"************* Split ***************"

"noremap <Leader>h :<C-u>split<CR>
"noremap <Leader>v :<C-u>vsplit<CR>

"************** Resize *************"

noremap <C-Up> :resize +2<CR>
noremap <C-Down> :resize -2<CR>
noremap <C-Left> :vertical resize +2<CR>
noremap <C-Right> :vertical resize -2<CR>


"******* Cambio de ventanas ********

noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"***************** Toogle Term ******************'
"nnoremap <A-t> :call TermToggle(10)<CR>
"inoremap <A-t> <Esc>:call TermToggle(10)<CR>
"tnoremap <A-t> <C-\><C-n>:call TermToggle(10)<CR>

"********* Term/norm-mode ********* 
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>

" Disable arrow keys (helped me learn Vim, and I do not use them)
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

map <C-V> "+gP
"map q <nop>


"*********** FzF *************"
nnoremap <leader>te :LoadTemplate<Cr>
map <silent> <C-f> :Files<CR>
nnoremap <leader>b :Buffers<CR>
"nnoremap <leader>g :Files<CR>
"nnoremap <leader>g :Rg<CR>
"nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>
nnoremap <leader>l :BLines<Cr>
nnoremap <leader>w :call fzf#vim#files('.', {'options':'--query '.expand('<cword>')})<CR>
"nnoremap <silent> <C-p> :call fzf#vim#files('.', {'options': '--prompt ""'})<CR>
nnoremap <silent> <C-p> :FZF -m<Cr>
nnoremap <leader>hi :History<CR>
nnoremap <leader>hh :History:<CR>
nnoremap <leader>c :call fzf#vim#commands()<Cr>
"nnoremap <leader>:Rg /usr/share/nvim/runtime/doc/<Cr>
"
"
"function! SearchWithAgInDirectory(...)
"   call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
"endfunction
"command! -nargs=+ -complete=dir AgIn call SearchWithAgInDirectory(<f-args>)
"
"
"
" choose from templates and apply to file
"
