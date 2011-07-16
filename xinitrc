#!/bin/sh
# ~/.xsession | ~/.xinitrc
# M. reDD MreDD (at) 0tue0.com
# http://m-redd.com
#
###############################
#Font Help
xset +fp ${HOME}/.fonts
# SSH
#eval `/usr/bin/ssh-agent`
#SSH_ASKPASS=/usr/lib/openssh/x11-ssh-askpass ssh-add < /dev/null

# Misc
if [ -f $HOME/.Xmodmap ]; then
    /usr/bin/xmodmap $HOME/.Xmodmap
fi

[ -f /etc/X11/Xmodmap ] && xmodmap /etc/X11/Xmodmap

# Aliases
x='xinit'

# Start Window Manager
case "$1" in
    awesome)
# Awesome
           autocutsel -fork &
           autocutsel -selection PRIMARY -fork &
           xrdb -load ~/.Xdefaults &
           xset m 4 1 &
           xcompmgr &
           xbindkeys &
           sabnzbd &
           xscreensaver -no-splash &
           #sh ~/scripts/synergyc start &
           synergys &
           numlockx &
           #noip2 -c ~/.noip2.rc &
           xset +fp /usr/share/fonts/local &
           xset fp rehash &
           xmodmap ~/.Xmodmap &
           sh ~/scripts/net/MultipleDropboxInstances.sh &
           #pkill -9 g15macro ; g15macro &
           #devmon 2>&1 > ~/tmp/devmon.log &
           sleep 1
           exec ck-launch-session awesome ;;
    lunchbox)
# Lunchbox
           autocutsel -fork &
           autocutsel -selection PRIMARY -fork &
           xrdb -load ~/.Xdefaults &
           xset m 4 1 &
           xcompmgr &
           xbindkeys &
           sabnzbd &
           xscreensaver -no-splash &
           #sh ~/scripts/synergyc start &
           synergys &
           numlockx &
           #noip2 -c ~/.noip2.rc &
           xset +fp /usr/share/fonts/local &
           xset fp rehash &
           xmodmap ~/.Xmodmap &
           sh ~/scripts/net/MultipleDropboxInstances.sh &
           #pkill -9 g15macro ; g15macro &
           #devmon 2>&1 > ~/tmp/devmon.log &
           sleep 1
           exec ck-launch-session lunchbox ;;
    wmfs)
# WMFS
           autocutsel -fork &
           autocutsel -selection PRIMARY -fork &
           xrdb -load ~/.Xdefaults &
           xset m 4 1 &
           xcompmgr &
           xbindkeys &
           sabnzbd &
           xscreensaver -no-splash &
           #sh ~/scripts/synergyc start &
           synergys &
           numlockx &
           #noip2 -c ~/.noip2.rc &
           xset +fp /usr/share/fonts/local &
           xset fp rehash &
           xmodmap ~/.Xmodmap &
           sh ~/scripts/net/MultipleDropboxInstances.sh &
           #pkill -9 g15macro ; g15macro &
           #devmon 2>&1 > ~/tmp/devmon.log &
           sleep 1
           exec ck-launch-session wmfs ;;
    *)
# WMii
           autocutsel -fork &
           autocutsel -selection PRIMARY -fork &
           xrdb -load ~/.Xdefaults &
           xset m 4 1 &
           xcompmgr &
           xbindkeys &
           sabnzbd &
           xscreensaver -no-splash &
           #sh ~/scripts/synergyc start &
           synergys &
           numlockx &
           #noip2 -c ~/.noip2.rc &
           xset +fp /usr/share/fonts/local &
           xset fp rehash &
           xmodmap ~/.Xmodmap &
           sh ~/scripts/net/MultipleDropboxInstances.sh &
           #pkill -9 g15macro ; g15macro &
           #devmon 2>&1 > ~/tmp/devmon.log &
           sleep 1
           #wistrut $(wmiir read /tag/sel/index | awk '/panel:stalonetray:panel/{print $2}') &
           #until wmii; do true; done
           until exec ck-launch-session wmii; do true; done ;;
esac
