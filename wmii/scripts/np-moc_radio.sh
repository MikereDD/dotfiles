#!/bin/bash  
# Notification RBar - for use with WMii, 
# helps to display now playing info from 
# MOC, MPlayer, VLC, LastFM, and Pandora.
# ( ie: LastFM - Shell-FM, Pandora - Pianobar )
#
# by: MikereDD

## Local Media Players
# Variables MOC - local player
INFO=`mocp -i`
STATE=`mocp -i | grep State`
ARTIST=`mocp -i | grep Artist | cut -f2 -d ":"`
TITLE=`mocp -i | grep SongTitle | cut -f2 -d ":"`

#Variables MPlayer - local player

# Variable VLC  -  local player

# Volume
VOLUME=$(sh $HOME/.wmii/scripts/vol.sh)
VOLUMET=$(sh $HOME/.wmii/scripts/vol-bar.sh)

## Streaming Radio Players
# Variables Shell-FM - radio
#IFONLFM=`sh $HOME/scripts/system/check_shell-fm_running-PID.sh`
if [ -f $HOME/.shell-fm/nowplaying ]; then
   IFONLFM=`sh $HOME/scripts/system/check_shell-fm_running-PID.sh`
   NPLFM=`cat $HOME/.shell-fm/nowplaying`
   echo -e "LastFM: $NPLFM | Vol: $VOLUME" | wmiir create /rbar/anowplaying
else
# Variables Pianobar - radio
IFONPB=`sh $HOME/scripts/system/check_pianobar_running-PID.sh`
NPPB=`cat $HOME/.config/pianobar/nowplaying`
   if [ "$IFONPB" = "On" ]; then
      echo -e "Pandora: $NPPB | Vol: $VOLUME" | wmiir create /rbar/anowplaying
#    sleep 10
#    wmiir remove /rbar/anowplaying
#else
elif [ "$STATE" == "State: PLAY" ]; then
    echo -e "+MOC+ np: $ARTIST - $TITLE | Vol: $VOLUME" | wmiir create /rbar/anowplaying
#    sleep 10
#    wmiir remove /rbar/anowplaying
else
    wmiir remove /rbar/anowplaying
fi
fi
