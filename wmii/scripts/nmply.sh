#!/bin/sh
# Now Playing On Mplayer
# http://m-redd.com
# Smaller than Life Projects
# By: MreDD
# projects - at - 0tue0 (dot) com
## 
#
#############################################

# Variables
NPMA=$(ps ax | grep "mplayer -ao" | awk '{$1="";$2=""; print $0}' | head -1 | awk '{print $3,$4,$5,$6}')
NPMB=$(ps ax | grep "mplayer -ao" | awk '{$1="";$2=""; print $0}' | head -1 | awk '{print $6}' | sed 's/\(.*\)\..*/\1/')
NPMC=$(ps ax | grep "mplayer -ao" | awk '{$1="";$2=""; print $0}' | head -1 | awk '{print $3,$4,$5}')
#
if [ "$NPMC" == "mplayer" ];then echo -e "On MPlayer: Player Empty.. [Nothing Playing]"

else
    if [ "$NPMC" == "mplayer -ao null" ];then echo -e "[MUTED] Watching: $NPMB"
else
    if [ "$NPMC" == "mplayer -ao alsa" ];then echo -e "Watching: $NPMB"
    fi
fi
fi
