#!/bin/bash
# On MPlayer
# simple script to display whats on mplayer
# by: MikereDD
#

ONNOWA="$(cat /home/typezero/.mplayer/nowplaying.log | grep "ID_FILENAME=" | cut -f 2 -d "=" | tail -1 | sed 's/\(.*\)\..*/\1/')"
ONNOWB="$(cat /home/typezero/.mplayer/nowplaying.log | grep "ID_FILENAME=" | cut -f 2 -d "=" | tail -1 | cut -f 2 -d "." | grep "flac")"
ONNOWC="$(cat /home/typezero/.mplayer/nowplaying.log | grep "ID_FILENAME=" | cut -f 2 -d "=" | tail -1 | cut -f 2 -d "." | grep "mp3")"
ONNOWD="$(cat /home/typezero/.mplayer/nowplaying.log | grep "ID_FILENAME=" | cut -f 2 -d "=" | tail -1 | cut -f 2 -d "." | grep "ogg")"

if [ "$ONNOWA" = "/dev/video0" ];then 
    ONNOW="[TV] $(sh $HOME/scripts/tv/tvguideparse.sh)"
#     ONNOW="[TV - tehIdiotBox]"
    echo -e "Watching: $ONNOW"
elif [ "$ONNOWB" = "flac" ];then
    echo -e ":FLAC: $ONNOWA"
elif [ "$ONNOWC" = "mp3" ];then
    echo -e ":MP3: $ONNOWA"
elif [ "$ONNOWC" = "ogg" ];then
    echo -e ":OGG: $ONNOWA"
else
    echo -e " $ONNOWA"
fi
