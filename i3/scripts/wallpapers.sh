#!/bin/sh
#---------------------------------------------
# file:     ~/.i3/scripts/wallpaper.sh
# author:   Mike Redd - http://m-redd.com/
# vim:fenc=utf-8:nu:ai:si:et:ts=4:sw=4:ft=sh:
#---------------------------------------------

WALLONE="wallpapers/Plus_by_MEGAFATBOY_BLUE.png"
WALLTWO="~/wallpapers/arch-linux-1920x1080_BLUE.png"
WALLTHREE="~/wallpapers/xanadouche-arch_BLUE.png"

while true; do
        find ~/.wallpaper/ -type f \( -name '*.jpg' -o -name '*.png' \) -print0 |
                shuf -n1 -z | xargs -0 feh --bg-center
        sleep 15m

done
