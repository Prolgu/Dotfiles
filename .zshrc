# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/sabaoth/.oh-my-zsh"
# export _JAVA_AWT_WM_NONREPARENTING=1


#source ~/.zsh/fzf.sh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
# Path to your oh-my-zsh installation.
# export ZSH="/home/mjolner/.oh-my-zsh"
export TERM="xterm-256color"                      # getting proper colors
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|reboot|history|cd -|cd ..)"
export EDITOR="emacsclient -t -a ''"              # $EDITOR use Emacs in terminal
export VISUAL="emacsclient -c -a emacs"           # $VISUAL use Emacs in GUI mode

export BROWSER=""
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# export RUST_HOME="$HOME/.rustup"
# export CARGO_HOME="$HOME/.cargo"
#Default
#export FZF_DEFAULT_OPTS='--height 60% --layout=reverse --border'
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#     --color=dark
#     --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
#     --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
#     --height 60% --layout=reverse --border
# '
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=fg:#d0d0d0,bg:#1e222a,hl:#5f87af
--color=fg+:#d8ff12,bg+:#262626,hl+:#5fd7ff
--color=info:#afaf87,prompt:#d7005f,pointer:#af5fff
--color=marker:#87ff00,spinner:#af5fff,header:#87afaf
--height 60% --layout=reverse --border '

#export BAT_THEME='Solarized (dark)'
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || bat --color=always {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
#export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
#export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_CTRL_R_OPTS='--sort --exact '
export FZF_CTRL_R_OPTS='--return-query-on-no-matches'

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# disable sort when completing `git checkout`
# zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
# zstyle ':fzf-tab:*' switch-group ',' '.'


# zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git web-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/aliases.zsh

#fzf-tab
# source ~/.oh-my-zsh/custom/plugins/fzf-tab/fzf-tab.zsh
# source ~/.oh-my-zsh/custom/plugins/fzf-tab/fzf-tab.plugin.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

function openNvim {
    if [ $# -eq 0 ]; then
        nvim ./
    else
        # nvim -w ~/.nvim_logs/$(date -Idate).log "$@"
        nvim $@
    fi
}

function fzf-cd() {
local dir
dir=$(find ${1:-.} -path '*/\.*' -prune \
    -o -type d -print 2> /dev/null | fzf +m) &&
    cd "$dir"
    # ls
}

function fzf-alice() {
CMD=$(
(
(alias)
(functions | grep "()" | cut -d ' ' -f1 | grep -v "^_" )
) | fzf | cut -d '=' -f1
);

eval $CMD
}

function fzf-find-files(){
local file=$(fzf --multi --reverse) #get file from fzf
if [[ $file ]]; then
    for prog in $(echo $file); #open all the selected files
    do; $EDITOR $prog &; done;
    else
        echo "Cancelado"
fi
}

function fzf-eval(){
    echo | fzf -q "$*" --preview-window=up:99% --preview="eval {q}"
}

function pepex(){
    echo "Chequeado maquinola!"
}



# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
    alias clear='vterm_printf "51;Evterm-clear-scrollback";tput clear'
fi

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(starship init zsh)"


# vim: set ts=4 sw=4 tw=120 et ft=sh:
