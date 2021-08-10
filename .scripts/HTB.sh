#!/bin/sh
 
IFACE=$(ifconfig | grep tun0 | awk '{print $1}' | tr -d ':')
 
if [ "$IFACE" = "tun0" ]; then
    echo "%{F#1bbf3e} %{F#e2ee6a}$(ifconfig tun0 | grep "inet " | awk '{print $2}')  %{u-}"
else
    echo "%{F#1bbf3e} %{F#ffffff}%{u-} Desconectado"
fi
