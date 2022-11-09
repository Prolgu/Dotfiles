#!/usr/bin/env bash

PROCESSCOUNT=$(ps -ef |grep -v grep |grep -cw "emacs --daemon")

if [ $PROCESSCOUNT -eq 0 ]
then
    #mailx -s "daemon process not running" myaddress@mydomain <msg body
    # notify-send "Emacs not running" "Starting now!"
    emacs --daemon
    # sleep 20
    emacsclient -nc
else
    # notify-send "Emacs running" "Launching now"
    sleep 5
    emacsclient -nc
fi
# emacsclient -c -n -e '(vterm) (switch-to-buffer "'"vterm"'")'
