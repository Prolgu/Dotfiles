#!/usr/bin/env bash

PROCESSCOUNT=$(ps -ef |grep -v grep |grep -cw "mpc")
MPC_BAND=$(mpc status|head -1|sed 's/\ - .*//g')
MPC_SONG=$(mpc status|head -1|sed 's/.*- //')

# sed 's/\ - .*//g' # obtiene la parte antes del "-"
# sed 's/.*- //' # obtiene la parte despues del "-"

if [ $PROCESSCOUNT -eq 0 ]
then
    notify-send "MPC not Running"
else
    notify-send "$MPC_BAND" "$MPC_SONG"
fi
