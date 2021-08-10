#!/bin/sh
 

IFACE=$(ifconfig | grep wlan0 | awk '{print $1}' | tr -d ':')
 
if [ "$IFACE" = "wlan0" ]; then
    echo "%{F#1bbf3e}  %{F#ffffff}$(ifconfig wlan0 | grep "inet " | awk '{print $2}')  %{u-}"
else
    echo "%{F#1bbf3e}Desconectado%{u-}"
fi

# if [ "$IFACE" = "wlan0" ]; then
#     nmcli -t -f name connection show --active
# else
#     echo Desconectado
# fi

# echo "%{F#2495e7}  %{F#ffffff}$(ifconfig wlan0 | grep "inet " | awk '{print $2}')%{u-}"


