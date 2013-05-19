#!/bin/bash
#
# Volume
VOLUME=$(sh $HOME/.wmii/scripts/vol.sh)
VOLUMET=$(sh $HOME/.wmii/scripts/vol-bar.sh)

# MPlayer
IFMPON=`sh $HOME/scripts/system/check_mplayer_running-PID.sh`
if [ "$IFMPON" = "On" ]; then
   echo -e "▶ $(sh ~/scripts/video/nowplaying-mplayer.sh)"
else

## Streaming Radio Players
# Variables Shell-FM - radio
#IFONLFM=`sh $HOME/scripts/system/check_shell-fm_running-PID.sh`
if [ -f $HOME/.shell-fm/nowplaying ]; then
   IFONLFM=`sh $HOME/scripts/system/check_shell-fm_running-PID.sh`
   NPLFM=`cat $HOME/.shell-fm/nowplaying`
   echo -e "♫ $NPLFM ♫ $VOLUME"
else
# Variables Pianobar - radio
IFONPB=`sh $HOME/scripts/system/check_pianobar_running-PID.sh`
NPPB=`cat $HOME/.config/pianobarfly/nowplaying`
   if [ "$IFONPB" = "On" ]; then
      echo -e "♫ $NPPB ♫ $VOLUME"
#    sleep 10
#    wmiir remove /rbar/anowplaying
else
IFONMOC=`sh $HOME/scripts/system/check_moc_running-PID.sh`
if [ "$IFONMOC" = "On" ]; then
#    echo "Off"
#else 
#if [ "$IFMOCON" = "On"]; then
# Variables MOC - local player
INFO=$(mocp -i)
STATE=$(mocp -i | grep State)
ARTIST=$(mocp -i | grep Artist | cut -f2 -d ":")
TITLE=$(mocp -i | grep SongTitle | cut -f2 -d ":")
#    if [ "$STATE" == "State: PLAY" ]; then
        echo -e "♫ $TITLE by $ARTIST ♫ $VOLUME"
    else
        echo -e "-"
fi
fi
fi
fi
