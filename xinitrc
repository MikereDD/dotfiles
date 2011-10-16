#!/bin/sh
# ~/.xsession | ~/.xinitrc
# M. reDD MreDD (at) 0tue0.com
# http://m-redd.com
#
###############################

# Aliases #
x='xinit'

# Font #
xset +fp ${HOME}/.fonts

# Misc #
if [ -f $HOME/.Xmodmap ]; then                                                                                                                                                                                                                 
    /usr/bin/xmodmap $HOME/.Xmodmap
fi

[ -f /etc/X11/Xmodmap ] && xmodmap /etc/X11/Xmodmap

# Run Apps #
autocutsel -fork &
autocutsel -selection PRIMARY -fork &
xset m 4 1 &
xset +fp /usr/share/fonts/local &
xset fp rehash &
# xmodmap ~/.Xmodmap &
# xrdb -load ~/.Xdefaults &
xrdb -merge ~/.Xresources
setterm -blank 0 -powersave off -powerdown 0
xset s off

# Start Applications
# sh ~/scripts/synergyc start &
synergys &
# sabnzbd &
# xcompmgr &
xbindkeys &
xscreensaver -no-splash &
numlockx &
# noip2 -c ~/.noip2.rc &
# pkill -9 g15macro ; g15macro &
# devmon 2>&1 > ~/tmp/devmon.log &
# VBoxClient-all &

# Mount Dropbox - Network Shares #
# multi-dropboxes &
# zeohn-sshfs mount  &

# WMii Helpers #
# wistrut $(wmiir read /tag/sel/index | awk '/panel:stalonetray:panel/{print $2}') &

# Start Window Manger #
# until wmii; do
#     true
# done
# Start Window Manager - Policy Kit #
until exec ck-launch-session wmii; do
    true
done
