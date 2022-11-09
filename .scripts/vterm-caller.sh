#!/usr/bin/env bash

PROCESSCOUNT=$(ps -ef |grep -v grep |grep -cw "emacs --daemon")

if [ $PROCESSCOUNT -eq 0 ]
then
    notify-send "Emacs not running" "Launching daemon now!"
    emacs --daemon
    emacsclient -c -e '(vterm) (switch-to-buffer "'"vterm"'")'
else
    # notify-send "Emacs running" "Launching now"
    emacsclient -c -e '(vterm) (switch-to-buffer "'"vterm"'")'
fi
