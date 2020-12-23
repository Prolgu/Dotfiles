#!/bin/sh

#compositor
picom -cC &

#wallpaper
nitrogen --restore &

#systray(Wi-Fi, BT)
nm-applet &
blueberry-tray 

#touchpad
sleep 2 && xinput set-prop 13 "libinput Accel Speed" -0.38 &
xinput set-prop 13 "libinput Tapping Enabled" 1 &

