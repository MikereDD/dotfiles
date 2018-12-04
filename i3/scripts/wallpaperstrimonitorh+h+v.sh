#!/bin/sh
#---------------------------------------------
# file:     ~/.i3/scripts/wallpaperstrimonitorh+h+v.sh
# author:   Mike Redd - http://m-redd.com/
# vim:fenc=utf-8:nu:ai:si:et:ts=4:sw=4:ft=sh:
#---------------------------------------------
H="$(ls $HOME/images/wallpapers/horizontal | shuf -n1)"
HM="$(ls $HOME/images/wallpapers/horizontalm | shuf -n1)"
V="$(ls $HOME/images/wallpapers/vertical | shuf -n1)"

while true; do
    feh --bg-center $HOME/images/wallpapers/horizontal/$H --bg-fill $HOME/images/wallpapers/vertical/$V --bg-center $HOME/images/wallpapers/horizontal/$HM
        sleep 15m

done
