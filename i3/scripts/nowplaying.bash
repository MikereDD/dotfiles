#!/bin/bash -
#===============================================================================
#
#          FILE: nowplaying
#
#         USAGE: ./nowplaying
#
#   DESCRIPTION: Now Playing script helps to display now playing info from
#                MOC, MPlayer, VLC, LastFM, Pandora and Spotify.
#                ( ie: LastFM - Shell-FM, Pandora - Pianobar )
#
#       OPTIONS: ---
#  REQUIREMENTS: bash, moc(Music On Console), MPlayer, Pianobar(Pandora, Shell-FM(LastFM), Spotify
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Mike Redd (MikereDD), mredd@0tue0.com
#  ORGANIZATION: Dumb Terminal Team
#       CREATED: 06/03/2012 05:27:57 PM PDT
#      REVISION: 07/02/2016 10:35:20 PM PDT
#===============================================================================
#
# Volume
VOLUME=$(sh $HOME/scripts/audio/vol.sh)
VOLUMET=$(sh $HOME/scripts/audio/vol-bar.sh)

# MPlayer
IFMPON=`sh $HOME/scripts/system/check_mplayer_running-PID.sh`
if [ "$IFMPON" = "On" ]; then
   echo -e "►$(sh ~/scripts/video/nowplaying-mplayer.sh)" #| Vol: $VOLUME
else

# VLC
IFVLCON=`sh $HOME/scripts/system/check_vlc_running-PID.sh`
if [ "$IFVLCON" = "On" ]; then
    echo -e "►$(sh ~/scripts/video/nowplaying-vlc.sh)" #| Vol: $VOLUME
else

    ## Streaming Radio Players
# Variables Shell-FM - radio
#IFONLFM=`sh $HOME/scripts/system/check_shell-fm_running-PID.sh`
if [ -f $HOME/.shell-fm/nowplaying ]; then
   IFONLFM=`sh $HOME/scripts/system/check_shell-fm_running-PID.sh`
   NPLFM=`cat $HOME/.shell-fm/nowplaying`
   echo -e ":♪: $NPLFM" #| Vol: $VOLUME
else
# Variables Pianobar - radio
IFONPB=`sh $HOME/scripts/system/check_pianobar_running-PID.sh`
NPPB=`cat $HOME/.config/pianobar/nowplaying`
   if [ "$IFONPB" = "On" ]; then
      echo -e ":♪: $NPPB" #| Vol: $VOLUME
#    sleep 10
#    wmiir remove /rbar/anowplaying
else
# Variables Pianobar fly - radio
IFONPF=`sh $HOME/scripts/system/check_pianobarfly_running-PID.sh`
NPPB=`cat $HOME/.config/pianobarfly/nowplaying`
   if [ "$IFONPF" = "On" ]; then
      echo -e ":♪: $NPPB" #| Vol: $VOLUME
#    sleep 10
#    wmiir remove /rbar/anowplaying
else
# Variables Spotify - radio
IFONSPOTIFY=`sh $HOME/scripts/system/check_spotify_running-PID.sh`
if [ "$IFONSPOTIFY" = "On" ]; then
    echo -e ":♪: np: $(sh ~/bin/spotify-nowplaying)"
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
        echo -e ":♪: np: $TITLE by $ARTIST on $ALBUM" #| Vol: $VOLUME
    else
        echo -e ":♭: x"
    fi
    fi
fi
fi
fi
fi
fi
