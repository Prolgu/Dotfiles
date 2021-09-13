" vim:fileencoding=utf-8:ft=vim:foldmethod=marker


"Coc-Explorer config {{{===============================================
function! s:explore()
  sleep 350m
  call execute('CocCommand explorer --preset tab')
endfunction

let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.config/nvim/',
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/nvim/plugin/plug-config',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floating': {
\     'position': 'floating',
\     'floating-width': 100,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'floating-height': 40,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'position':'floating',
\     'floating-width': 100,
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }

"}}}

      " \     'floating-position':'right-center',
            " \     'floating-height': 20,

nmap <silent> <S-tab> :CocCommand explorer<CR>

" List all presets
" nmap <leader>el :CocList explPresets<Cr>

" Use preset argument to open it
" nmap <silent> <leader>ed :CocCommand explorer --preset .vim<CR>
" nmap <silent> <leader>ec :CocCommand explorer --preset cocConfig<CR>
" nmap <silent> <tab> :CocCommand explorer --preset buffer<CR>
" nmap <F2> :CocCommand explorer --preset floatingLeftside<Cr> 

" autocmd User CocNvimInit :CocCommand explorer --preset simplify
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | :call s:explore()  | endif
" autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
