# file:     ~/.xsession
# author:   Mike Redd - http://m-redd.com
# modified: Monday Jan. 16 11:43:41(PST) 2012
# vim: set fenc=utf-8:nu:ai:si:et:ts=4:sw=4:ft=xdefaults:
# ----------------------------------------------------------------------------

eval $(gpg-agent --daemon) &
#
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

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
#
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
setterm -blank 0 -powersave off -powerdown 0
xset s off
#
#xcompmgr -CcfF -I-.010 -O-.03 -D3 -t-.5 -l-2 -r3.1 -o.3 -s &
xbindkeys &
xscreensaver -no-splash &
numlockx &
irexec &
#
VBoxClient-all &
setxkbmap -option compose:paus &
#start-pulseaudio-x11 &
bash -c "xhost +si:localuser:$(whoami)" &

# urxvt daemon
/usr/bin/urxvtd -q -o -f

# nzbget
#nzbget -c ~/.config/nzbget/nzbget.conf -D &

# start pulseaudio
pulseaudio --start

# check pid's
sh ~/scripts/system/check_pid.sh dhcpcd root &

# firewall
firewall start
firewall save

# wallpaper
sh ~/.i3/scripts/wallpapers.sh &

# wicd
wicd-client --tray &

# ---- window manager ----
# launch i3
systemd --user &
exec i3
