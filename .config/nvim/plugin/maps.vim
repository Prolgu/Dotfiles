"============================================="
"                 Nvim-Maps                   "
"============================================="


"================ Mapleader =================="
" let mapleader=','

"============== FunctionKeys ================="

"No <F1> help on insert
" imap <F1> <nop>
" Set paste con aviso
" nnoremap <F2> :set paste!<bar>:set paste?<cr>
" TermDown
" nnoremap <silent> <F4> :Termy<CR>
" inoremap  <F4> <esc>:Termy<CR>
" FloatermToggle "
" noremap  <silent> <F12> <Esc>:FloatermToggle<CR>
" noremap! <silent> <F12> <Esc>:FloatermToggle<CR>
" tnoremap <silent> <F12> <C-\><C-n>:FloatermToggle<CR>
"============================================"

" nnoremap <silent> k gk
" nnoremap <silent> j gj
" Guardar y salir 
" nmap <C-q> :q!<Cr>

" Buff close 
" nnoremap <silent> q :bd<Cr>
" nnoremap <silent> Q :q!<Cr>

" Tab
" nnoremap <silent> <S-tab> :History<Cr>
" nnoremap <silent> <S-t> :tabnew<Cr>

" nmap <C-j> <C-w>j
" nmap <C-k> <C-w>k
" nmap <C-l> <C-w>l
" nmap <C-h> <C-w>h

" Term/norm-mode  
" tnoremap <Esc> <C-\><C-n>
" tnoremap :q! <C-\><C-n>:q!<CR>

" Paste
" imap <C-V> <Esc>"+gPi

"=================== Arrows ==================

"Indent and move text"
" vnoremap <silent> <Left> <gv
" vnoremap <silent> <Right> >gv
" vnoremap <silent> <Down> :m '>+1<CR>gv=gv
" vnoremap <silent> <Up> :m '<-2<CR>gv=gv

"page up/down"
" nnoremap <PageUp> <C-u>
" nnoremap <PageDown> <C-d>
" inoremap <PageUp> <nop>
" inoremap <PageDown> <nop>

" nmap <up> <nop>
" nmap <down> <nop>
" nmap <silent> <left> :bp<Cr>
" nmap <silent> <right> :bn<Cr>
" nmap <silent> <left> :tabNext<Cr>
" nmap <silent> <right> :tabprev<Cr>

"Resize"
" noremap <silent> <C-Up> :resize +2<CR>
" noremap <silent> <C-Down> :resize -2<CR>
" noremap <silent> <C-Left> :vertical resize +2<CR>
" noremap <silent> <C-Right> :vertical resize -2<CR>
"================= LeaderKey ================="

" Directorio de trabajo
" nnoremap <Leader>. :echo expand('%:p:h')<CR>

" Indent guides
" nnoremap <silent> <leader>ig :call IndentGuides()<cr>

" Split 
" nmap <silent> <Leader>hs :<C-u>split<CR>
" nmap <silent> <Leader>vs :<C-u>vsplit<CR>

" Share Code 
" xnoremap <silent> <leader>ss :Share<Cr><Cr> 

" Search Code 
" xnoremap <silent> <leader>gg :Go<Cr>

" FZF 
" nmap <silent> <C-p> :Files<CR>
" imap  <C-p> <Esc> :Files<CR>

" FZF-buf/mark
" nnoremap <leader>b :Buffers<CR>
" nnoremap <leader>mk :Marks<CR>

" nnoremap <silent> <leader>l :BLines<Cr>
" nnoremap <silent> <leader>w :call fzf#vim#files('.', {'options':'--query '.expand('<cword>')})<Cr><Cr>
" nnoremap <silent> <leader>h :History:<CR>
" nnoremap <silent> <leader>c :call fzf#vim#commands()<Cr>

" nnoremap <silent> <leader>hi :History<CR>
" nnoremap <silent> <leader>t :LoadTemplate<Cr>
"==========================================================="
" inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
"   \ 'prefix': '^.*$',
"   \ 'source': 'rg -n ^ --color always',
"   \ 'options': '--ansi --delimiter : --nth 3..',
"   \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

