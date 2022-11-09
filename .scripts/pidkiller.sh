#!/bin/sh

#Find the Process ID for syncapp running instance

# PID=`ps -ef | grep emacs 'awk {print $2}'`

# if [[ -z "$PID" ]] then
# Kill -9 PID
# fi
ps -ef | grep emacs | grep -v grep | awk '{print $2}' | xargs kill
