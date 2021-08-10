#!/bin/bash

cmd=$(echo -e “suspend\n logout \n reboot \n poweroff” | rofi -width 350 -dmenu -p system:)
case $cmd in
suspend)
systemctl suspend ;;
reboot)
systemctl reboot ;;
poweroff)
systemctl poweroff ;;
esac
