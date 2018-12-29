#!/usr/bin/env bash
#
# file:     $HOME/.xinitrc
# author:   Mike Redd - http://git.m-redd.com
# modified: Fri Dec 28 15:45:00 CST 2018
# vim: set fenc=utf-8:nu:ai:si:et:ts=4:sw=4:ft=xdefaults:
# ----------------------------------------------------------

# GPG agent
eval $(gpg-agent --daemon) &

# Disable bell
xset -b

# Fonts
#xset +fp ${HOME}/.fonts
xset +fp /usr/share/fonts/local
#xset +fp /usr/share/fonts/TTF
xset fp rehash &

# Source system xinit.d files
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# Xmodmap xmodmaprc
#if [ -f $HOME/.xmodmaprc ]; then
#    /usr/bin/xmodmap $HOME/.xmodmaprc
#fi

# Xmodmap
#[ -f /etc/X11/Xmodmap ] && xmodmap /etc/X11/Xmodmap

# Extra settings
#autocutsel -fork &
#autocutsel -selection PRIMARY -fork &
#xset m 4 1 &

# Xresources
[[ -f $HOME/.Xresources ]] && xrdb -merge $HOME/.Xresources
#setterm -blank 0 -powersave off -powerdown 0
#xset s off

# Load apps
xbindkeys
#xscreensaver -no-splash &
numlockx &
#irexec &
#VBoxClient-all &
#setxkbmap -option compose:paus &
#bash -c "xhost +si:localuser:$(whoami)" &
#/usr/bin/urxvtd -q -o -f

# Check pid's
#sh $HOME/scripts/system/check_pid.sh dhcpcd root &

# Load Wallpaper
#sh $HOME/.i3/scripts/wallpapers.sh &
#sh $HOME/.i3/scripts/wallpapersdualmonitorh+v.sh &
sh $HOME/.i3/scripts/wallpaperstrimonitorh+h+v.sh &

# wicd
#wicd-client --tray &

# ---- window manager ----
# launch i3 with process ID
i3 & wmpid=$!
# systemd user
systemd --user &
# launch i3 and log
#exec i3 -V >> $HOME/log/i3log-$(date +'%F-%k-%M-%S') 2>&1
# i3 hang point
wait $wmpid
#exec fluxbox
