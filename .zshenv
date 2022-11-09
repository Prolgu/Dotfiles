# vim:fileencoding=utf-8:foldmethod=marker:ft=sh
source ~/.zshrc
# Archivos de configuracion

# -- CF {{{1

# -- Zsh -- {{{2
alias -g zc="$HOME/.zshrc"
alias -g shrc="$HOME/.config/starship.toml"
# alias -g rfl="$HOME/.scripts/launcher.sh"

# -- Kitty -- {{{2
alias -g kc="$HOME/.config/kitty/kitty.conf"

# -- p10k -- {{{2
# alias -g 10k="$HOME/.p10k.zsh"

# -- Picom -- {{{2
alias -g pico="$HOME/.config/picom.conf"

# -- Polybar -- {{{2
alias -g poly="$HOME/.config/polybar/config.ini"

# -- Window managers {{{2
# alias -g ac="$HOME/.config/awesome/rc.lua"
# alias -g qc="$HOME/.config/qtile/config.py"
alias -g i3c="$HOME/.config/i3/config"

# -- Bspwmrc + sxhkdrc {{{3
alias -g brc="$HOME/.config/bspwm/bspwmrc"
alias -g sxrc="$HOME/.config/sxhkd/sxhkdrc"

# -- Vimrc/Nvimrc/Nvim Maps  {{{2
alias -g vc="$HOME/.vimrc"
alias -g nvc="$HOME/.config/nvim/init.vim"
alias -g nvp="$HOME/.config/nvim/lua/plugin.lua"
alias -g maps="$HOME/.config/nvim/lua/maps.lua"
alias nvim-update="$HOME/Develop/nvim-updater.sh"

# -- Tmux -- {{{2
alias -g tmc="$HOME/.tmux.conf"

# -- Rofi -- {{{2
alias -g rasi="$HOME/.config/rofi/config.rasi"

# -- Alice {{{2
# alias -g alice="$HOME/.zsh/aliases.zsh"
alias -g alice="$HOME/.zshenv"
alias -g allice="$HOME/.zshenv"
alias conejo="bat $HOME/.zshenv"
alias wonderland="nvim $HOME/.zshenv"


# -- Folders {{{1

# -- Lugares {{{2
alias dev="$HOME/Develop && clear"
alias codesh="$HOME/Develop/ShellSC && clear"
alias codepy="$HOME/Develop/PythonSC && clear"
alias codelua="$HOME/Develop/LuaSC && clear"
alias codejs="$HOME/Develop/CodeJS && clear"
alias coders="$HOME/Develop/CodeRS && clear"
# alias coderhouse="$HOME/Develop/CodeJS/coderhouse && clear"
alias cdev="$HOME/Develop/CodeC && clear"
alias codecpp="$HOME/Develop/CodeCPP && clear"
alias codej="$HOME/Develop/CodeJava && clear"
alias wds="$HOME/Develop/WebDesigne && clear"
# alias blog="$HOME/Develop/WebDesigne/Blog && clear"
# -- Run Media {{{3
# alias tsd="/run/media/sabaoth/A7F7-9C85/ && clear"

# -- Relativo a nvim {{{3

alias ftv="$HOME/.config/nvim/after/ftplugin && clear"
alias pluv="$HOME/.config/nvim/plugin && clear"
alias nvf="$HOME/.config/nvim/ && clear"
# alias n='nvim -w ~/.nvim_keylog "$@"'
# alias n='nvim -w ~/.nvim_logs/$(date -Idate).log "$@"'

# -- Aplicaciones {{{1

alias fv="find **/*.* | fzf --multi | xargs -ro  nvim"
# alias nv="openNvim"
alias nv="nvim"
alias thu="thunar &"
# Emacs
alias omc="emacsclient"
alias mackie="emacsclient -c -n"
alias mackied="$HOME/.scripts/mackie-helper.sh -s"
alias kimackie="emacsclient -e '(kill-emacs)'"
# alias remackie="systemctl --user restart emacs.service"
alias remackie="emacsclient -e '(kill-emacs)' && emacs --daemon"


# -- CLI Shortcuts {{{1

# -- XDG {{{2
alias open="xdg-open"

# -- Clipboard {{{2 #
alias xcopy="xclip-copyfile"
alias xpaste="xclip-pastefile"
alias xcopy-text="xclip -sel c"

# -- Clear {{{2
# alias cl="clear && exa -lhS"
alias clt="clear && cd"
# alias cle="clear && exa -lhS"

# -- List {{{2
# alias ls="exa"
alias lst="exa -l --group-directories-first --classify"
alias ll="exa -lh"
alias la="exa -lha"
alias lhs="exa -lhS"
alias lsa='exa -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='exa -lhSa'
alias tree="exa --tree"
alias data="fzf | xargs exa -l"

# -- Grep {{{2
alias grep="grep --color=auto"
alias rg="rg --colors 'match:fg:255,255,0'"

alias cat="bat"
alias nweb="~/.scripts/Kreator.py"
alias vaders="~/.scripts/invaders.sh"

alias resolucion="xdpyinfo | grep 'dimensions:'"

# -- Git {{{2
alias gcout="git branch | fzf --multi | xargs -ro git checkout"
alias gacp="git add . && git commit -m "$(date)" && git push"


# -- Pack-managers {{{1

# -- YAY {{{2
alias yff="yay -Ss | fzf --multi --preview 'yay -Si {1}' | xargs -ro  yay -S"
alias yss="yay -Ss"
alias yrm="yay -Rn"
# alias yupg="yay -Syu"
alias yud="yay -Syy"
alias ys="yay -S"

# -- Pacman {{{2

alias pff="pacman -Slq | fzf -m --preview 'pacman -Si {1}' | xargs -r sudo pacman -S"
alias pss="sudo pacman -Ss"

# -- MPC alias {{{1

alias mplay="mpc play"
alias mstat="mpc status"
alias mpause="mpc pause"
alias mstop="mpc stop"
alias mload="mpc load"
alias mnext="mpc next"
alias mprev="mpc prev"
alias mvol="mpc volume"

alias band-add="echo -e \$(mpc status|head -1|sed 's/ - .*//')>>~/lista-bandas"
alias band-add-long="echo -e \$(mpc status|head -1)>>~/lista-bandas"
alias band-show="cat ~/lista-bandas"
# alias band-show-long="cat ~/lista-bandas-long"
alias band-add-show="band-add && band-show"
# -- Otros {{{1

# -- ZSH {{{2
alias zuc="source ~/.zshrc && clear"
alias zud="omz update"

# -- System {{{2
alias wifilist="nmcli -g SSID device wifi list"
alias wilist="nmcli  device wifi list"
alias apagar="shutdown -P now"
alias reiniciar="shutdown -r now"

# -- WebDesigne {{{2
# alias modeler="$HOME.scripts/bash-modeler.sh"
# alias live="live-server --browser=luakit . &"

# -- Tmux {{{2
alias mux="tmux new-session -A -s ws"

# -- Bspwm {{{2
alias brload="bspc wm -r"

# -- ST Reload {{{2

alias load="kill -USR1 $(pidof st)"
alias use="xrdb merge"

# -- FZF-Finding {{{1
alias fff="fzf-find-files"

# -- Templates {{{1
alias jstemplate="touch index.html main.js"

# -- texcompile {{{1
alias texcompile="$HOME/.scripts/texcompile"






# Deprecated {{{1

# alias google="~/.scripts/google-search.sh"

# alias -g ac="$HOME/.config/alacritty/alacritty.yml"
# alias salir="i3-msg exit"
# alias  =""
# alias  ysi="yay -Qqe | fzf --multi --preview 'yay -Si {1}' | xargs -ro  yay -Qqe"

# archivos
# alias -s py="nvim"
# alias -s js="nvim"
# alias -s sh="nvim"
# alias -s css="nvim"
# alias -s html="nvim"

# alias fcd="cd $(ls -d */ | fzf)"

# alias ala="alacritty &"
# alias  code="vscodium &"

# Radio
# alias doom="alacritty --class Pyradio --title Pyradio -e pyradio -p 8 &"
# alias praise="alacritty --class Pyradio --title Pyradio -e pyradio -p 1 &"

# }}}
