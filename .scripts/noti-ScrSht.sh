#! /usr/bin/env bash
scrot ~/Imágenes/Screenshot-$(date +%F_%T).jpg
screen="~/Imágenes/Screenshot-$(date +%F_%T).jpg"
notify-send --icon $screen "ScreenShot" "$(date -u +"%Y-%m-%d %H:%M")"

