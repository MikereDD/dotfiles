#!/bin/bash
#
#!/bin/bash
#
# Post whats Now Playing on MPlayer
# on Facebook
# by: MreDD
#
NPMA=$(ps ax | grep "mplayer -ao" | awk '{$1="";$2=""; print $0}' | head -1 | awk '{print $3,$4,$5,$6}')
NPMB=$(ps ax | grep "mplayer -ao" | awk '{$1="";$2=""; print $0}' | head -1 | awk '{print $6}' | sed 's/\(.*\)\..*/\1/')
NPMC=$(ps ax | grep "mplayer -ao" | awk '{$1="";$2=""; print $0}' | head -1 | awk '{print $3,$4,$5}')
#
if [ "$NPMC" == "mplayer" ];then 
    echo "Nothing to Post on Facebook."
    exit 0
else
    echo "Posting Now Playing Status on Facebook"
    if [ "$NPMC" == "mplayer -ao alsa" ];then 
    fbcmd post "is watching $NPMB with MPlayer"
    fi
fi
