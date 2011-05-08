#!/bin/sh
# ~/.xsession | ~/.xinitrc
# M. reDD MreDD (at) 0tue0.com
# http://m-redd.com
#
###############################
#Synergy
#/usr/bin/killall synergyc 
#sleep 1 
#synergyc 172.16.128.8
#Font Help
xset +fp ${HOME}/.fonts
# SSH
eval `/usr/bin/ssh-agent`
SSH_ASKPASS=/usr/lib/openssh/x11-ssh-askpass ssh-add < /dev/null

# Misc
if [ -f $HOME/.Xmodmap ]; then
    /usr/bin/xmodmap $HOME/.Xmodmap
fi

[ -f /etc/X11/Xmodmap ] && xmodmap /etc/X11/Xmodmap

autocutsel -fork &
autocutsel -selection PRIMARY -fork &
xrdb -load .Xdefaults &
xset m 4 1 &
xcompmgr &
xbindkeys &
sabnzbd &
xscreensaver -no-splash &
synergys &
numlockx &
#noip2 -c /home/mredd/.noip2.rc
xset +fp /usr/share/fonts/local
xset fp rehash
#xmodmap ~/.xmodmap-`uname -n`
#sh ~/scripts/net/MultipleDropboxInstances.sh 
sleep 1
#sh ~/scripts/synergyc start
#wistrut $(wmiir read /tag/sel/index | awk '/panel:stalonetray:panel/{print $2}') &
#until exec ck-launch-session wmii; do true ; done
until exec wmii; do true ; done
