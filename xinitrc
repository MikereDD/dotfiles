# ----------------------------------------------------------------------------
# file:     ~/.xsession
# author:   Mike Redd - http://m-redd.com
# modified: Monday Jan. 16 11:43:41(PST) 2012
# vim: set fenc=utf-8:nu:ai:si:et:ts=4:sw=4:ft=xdefaults:
# ----------------------------------------------------------------------------

# Aliases #
startx='x'
x='xinit'

# Font #
xset +fp ${HOME}/.fonts

# Misc #
if [ -f $HOME/.xmodmaprc ]; then                                                                                                                                                                                                                 
    /usr/bin/xmodmap $HOME/.xmodmaprc
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
#xrdb -merge ~/.Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
setterm -blank 0 -powersave off -powerdown 0
xset s off

# Start Applications
# sh ~/scripts/synergyc start &
#synergys &
# sabnzbd &
xcompmgr &
xbindkeys &
xscreensaver -no-splash &
numlockx &
# noip2 -c ~/.noip2.rc &
# pkill -9 g15macro ; g15macro &
# devmon 2>&1 > ~/tmp/devmon.log &
VBoxClient-all &
setxkbmap -option compose:paus
#start-pulseaudio-x11 &
# Mount Dropbox - Network Shares #
# multi-dropboxes &
# zeohn-sshfs mount  &

# WMii Helpers #
# wistrut $(wmiir read /tag/sel/index | awk '/panel:stalonetray:panel/{print $2}') &

# Start Window Manger #

## WMii
 until wmii; do
     true
 done

