#!/bin/sh

target=$(cat ~/.scripts/target)
trg=~/.scripts/target

if [ $target ]; then
    echo "%{F#ff6c6b}什 %{F#ffffff}$target"
else
    while [[ -z $(grep '[^[:space:]]' $trg) ]]; do

        echo "%{F#ff6c6b}Sin Objetivo"
        sleep 0.5
        echo "            "
        sleep 0.5

        if [[ ! -z $(grep '[^[:space:]]' $trg) ]];
        then
           break 
        fi
    done
fi

# [ -z $(grep '[^[:space:]]' $filename)] 

    # while [ -z $(grep '[^[:space:]]' $trg)]; do

    #     echo "%{F#ff6c6b}Sin Objetivo"
    #     sleep 0.5
    #     echo "            "
    #     sleep 0.5

    #     if [ ! -z $(grep '[^[:space:]]' $trg)];
    #     then
    #        break 
    #     fi
    # done
