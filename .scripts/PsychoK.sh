#!/usr/bin/bash

## uncomment lines 4-11 then add to zsh keybinds (default is ctrl+k)
#use fzf to kill proccesses
## fkill_widget() {
## sh $HOME/scripts/fkill     # call fkill script locus
##  zle reset-prompt      
## }
## zle -N fzf-redraw-prompt    # give me my $PS1 back
## zle -N fkill_widget
## bindkey '^k'  fkill_widget    #ctrl+k

################ fkill script start ###########
# export FZF_DEFAULT_OPTS='
#   --color fg:-1,bg:-1,hl:202,fg+:214,bg+:52,hl+:231
#   --color info:52,prompt:196,spinner:208,pointer:196,marker:208
# '

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --color=fg:#d0d0d0,bg:#282c34,hl:#5f87af
 --color=fg+:#d8ff12,bg+:#262626,hl+:#5fd7ff
 --color=info:#afaf87,prompt:#d7005f,pointer:#af5fff
 --color=marker:#87ff00,spinner:#af5fff,header:#87afaf'


# if [ "$UID" != "0" ]
#     then
#         # pid=$(ps -f -u $UID | sed 1d | fzf -m --ansi --color fg:-1,bg:-1,hl:46,fg+:40,bg+:233,hl+:46 --color prompt:166,border:40 --height 50% --prompt="➤  " --pointer="➤ " --marker="➤ " | awk '{print $2}') 
#         pid=$(ps -f -u $UID | sed 1d | fzf -m --ansi --height 60% --prompt="➤  " --pointer="➤ " --marker="➤ " | awk '{print $2}') 
#     else
#         pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}') 
#     fi
# if [ "x$pid" != "x" ]
#     then
#         echo $pid | xargs kill -${1:-9}
# fi

############## fkill script end  #############

fkiller() {
    local pid 
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi  

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi  
}

fkiller "$@"
