# vim:fileencoding=utf-8:ft=zsh:foldmethod=marker
# archivos de configuracion

# Configs {{{ ====================

# -- Zsh config file
alias -g zc="$HOME/.zshrc"
alias -g rfl="$HOME/.scripts/launcher.sh"

# -- Kitty config file
alias -g kc="$HOME/.config/kitty/kitty.conf"

# -- 10k  config file
alias -g 10k="$HOME/.p10k.zsh"

# -- Picom config file
alias -g pico="$HOME/.config/picom.conf"

# -- Polybar config file
alias -g poly="$HOME/.config/polybar/config"

# -- Window managers config files 
alias -g ac="$HOME/.config/awesome/rc.lua"
alias -g qc="$HOME/.config/qtile/config.py"
alias -g i3c="$HOME/.config/i3/config"

# -- Vimrc/Nvimrc/Nvim Maps 
alias -g vc="$HOME/.vimrc"
alias -g nvc="$HOME/.config/nvim/init.vim"
alias -g maps="$HOME/.config/nvim/lua/map.lua"

# Bspwmrc & sxhkdrc
alias -g brc="$HOME/.config/bspwm/bspwmrc"
alias -g sxrc="$HOME/.config/sxhkd/sxhkdrc"

# -- Tmux config file
alias -g tmc="$HOME/.tmux.conf"

# -- Rofi config file
alias -g rasi="$HOME/.config/rofi/config.rasi"

# -- Alice 
alias -g alice="$HOME/.zsh/aliases.zsh"
alias conejo="bat ~/.zsh/aliases.zsh"

# }}}

# Folders {{{====================

# -- Lugares
alias dev="$HOME/Develop && clear"
alias scs="$HOME/Develop/ScriptSH && clear"
alias scpy="$HOME/Develop/ScriptPY && clear"
alias sclu="$HOME/Develop/LuaSC && clear"
alias scjs="$HOME/Develop/ScriptJS && clear"
alias codec="$HOME/Develop/CodeC && clear"
alias codecpp="$HOME/Develop/CodeCPP && clear"
alias wds="$HOME/Develop/WebDesigne/Bios && clear"

alias ftv="$HOME/.config/nvim/after/ftplugin && clear"
alias pluv="$HOME/.config/nvim/plugin && clear"
alias nvf="$HOME/.config/nvim/ && clear"

alias tsd="/run/media/sabaoth/A7F7-9C85/ && clear"


# -- Aplicaciones

alias fv="find **/*.* | fzf --multi --preview 'bat --color=always {1}' | xargs -ro  nvim"
alias nv="openNvim"
alias thu="thunar &"

# }}}

# Shortcuts {{{ ====================

# Clear
alias cl="clear"
alias clt="clear && cd"
alias cle="clear && exa -lhS"

alias lst="exa -l --group-directories-first --classify"
alias lhs="exa -lhS"
alias tree="exa --tree"
alias info="fzf | xargs exa -l"

alias grep="grep --color=auto"

alias rg="rg --colors 'match:fg:255,255,0'"

alias cat="bat"
alias nweb="~/.scripts/Kreator.py"
alias vaders="~/.scripts/invaders.sh"

alias resol="xdpyinfo | grep 'dimensions:'"

# Git
alias gcout="git branch | fzf --multi | xargs -ro git checkout"
alias gacp="git add . && git commit -m "$(date)" && git push"

# }}}

# Alias Yay {{{ ====================

alias yff="yay -Ss | fzf --multi --preview 'yay -Si {1}' | xargs -ro  yay -Ss"
alias yss="yay -Ss"
alias yrm="yay -Rn"
alias yupg="yay -Syu"
alias yud="yay -Syy"
alias ys="yay -S"

# }}}

# Alias Pacman {{{ ====================

alias pff="pacman -Slq | fzf -m --preview 'pacman -Si {1}' | xargs -r sudo pacman -S"
alias pss="sudo pacman -Ss"

# }}}

# MPC alias {{{ ====================

alias mplay="mpc play"
alias mload="mpc load"
alias next="mpc next"
alias prev="mpc prev"

# }}}

# Bspwm 
alias restb="bspc wm -r"

# Otros alias {{{ ====================

alias zup="source ~/.zshrc && clear"
alias zud="omz update"
alias apagar="shutdown -P now"
alias reiniciar="shutdown -r now"
alias wifilist="nmcli -g SSID device wifi list"
alias modeler="$HOME.scripts/bash-modeler.sh"
alias live="live-server --browser=luakit . &"

# }}}


# Reload para ST

alias load="kill -USR1 $(pidof st)"
alias  use="xrdb merge"




# Deprecated {{{

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

