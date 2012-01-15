#!/bin/bash
#
# Simple script to echo now playing to WMii statusbar
# Apps:
#  Pianobar=Pandora, Shell-FM=LastFM, MPlayer, VLC, MOC Music On Console
##
# by: MikereDD
##

# Variables
## PID's
IFONPB=`sh $HOME/scripts/system/check_pianobar_running-PID.sh`
IFONLFM=`sh $HOME/scripts/system/check_shell-fm_running-PID.sh`
IFONMP=`sh $HOME/scripts/system/check_mplayer_running-PID.sh`
IFONVLC=`sh $HOME/scripts/system/check_vlc_running-PID.sh`
IFONMOC=`sh $HOME/scripts/system/check_moc_running-PID.sh`

# Volume
VOLUME=$(sh $HOME/.wmii/scripts/vol.sh)
VOLUMET=$(sh $HOME/.wmii/scripts/vol-bar.sh)

## Local Media Players
# Pianobar
NPPB=$(cat $HOME/.config/pianobar/nowplaying)

# Shell-FM
NPLFM=$(cat $HOME/.shell-fm/nowplaying)

# MPlayer
NPMP=$(sh $HOME/scripts/video/nowplaying-mplayer.sh)

# VLC
NPVLC=$(sh $HOME/scripts/video/nowplaying-vlc.sh)

# MOC - Music On Console
INFO=`mocp -i`
STATE=`mocp -i | grep State`
ARTIST=`mocp -i | grep Artist | cut -f2 -d ":"`
TITLE=`mocp -i | grep SongTitle | cut -f2 -d ":"`

#if [ -f "$HOME/.shell-fm/nowplaying" ]; then
if [ "$IFONLFM" = "On" ]; then
   echo -e "LastFM: $NPLFM | Vol: $VOLUME" | wmiir create /rbar/anowplaying
elif [ "$IFONPB" = "On" ]; then
      echo -e "Pandora: $NPPB | Vol: $VOLUME" | wmiir create /rbar/anowplaying
elif [ "$IFONMP" = "On" ]; then
      echo -e "$NPMP | Vol: $VOLUME" | wmiir create /rbar/anowplaying
elif [ "$STATE" = "State: PLAY" ]; then
#elif [ "$IFONMOC" = "On" ];then
    echo -e "+MOC+ np: $ARTIST - $TITLE | Vol: $VOLUME" | wmiir create /rbar/anowplaying
else
    wmiir remove /rbar/anowplaying
fi
