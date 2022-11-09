#!/usr/bin/env bash
#-*- coding: utf-8 -*-
#
#  oni-goroshi.sh
#
#  2021 <https://github.com/Prolgu>
#
#
#
# Code start {{{


# PROCESSCOUNT1=$(ps -ef |grep -v grep |grep -cw "emacs --daemon")
PROCESSCOUNT2=$(ps -ef |grep -v grep |grep -cw "emacs")

# if [ $PROCESSCOUNT1 -eq 0 ] ; then
#     emacsclient -e '(kill-emacs)'
#     notify-send "Killing Emacs" "Re-starting emacsclient now!"; emacs --daemon
#     emacsclient -nca emacs
# fi

if [ $PROCESSCOUNT2 -eq 0 ] ; then
    # pkill emacs
    ps -ef | grep emacs | grep -v grep | awk '{print $2}' | xargs kill -9
    notify-send "Killing Emacs" "Re-starting emacs now!"; emacs --daemon
    emacsclient -nca emacs
else
    ps -ef | grep emacs | grep -v grep | awk '{print $2}' | xargs kill -9
    notify-send "Killing Emacs" "Re-starting emacs now!"; emacs --daemon
    emacsclient -nca emacs
fi

# Code end }}}

