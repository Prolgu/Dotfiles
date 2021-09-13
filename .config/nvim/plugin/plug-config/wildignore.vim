" vim:fileencoding=utf-8:ft=vim:foldmethod=marker

"======================= Wildmenu ==========================="

" WildIgnore  {{{======================================================
silent! set wildchar=9 nowildmenu wildmode=longest,full wildmenu wildoptions= wildignorecase fileignorecase
silent! set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib "stuff to ignore when tab completing
silent! set wildignore+=__pycache__,.stversions,*.spl,*.out,%*
silent! set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
silent! set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz
silent! set wildignore+=*DS_Store*,*.ipch
silent! set wildignore+=*.gem
silent! set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
silent! set wildignore+=*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
silent! set wildignore+=*/.nx/**,*.app,*.git,.git
silent! set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
silent! set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
silent! set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
silent! set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
silent! set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
silent! set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
silent! set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
silent! set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android
silent! set wildignore+=*/tmp/*,,*.db,*.sqlite
" }}}
