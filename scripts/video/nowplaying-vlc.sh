#!/bin/sh
# Variables
NPV=$(ps aux | grep vlc | head -1 | awk '{ print $12 }' | sed 's/\(.*\)\..*/\1/')
#
if [ "$NPV" == "" ];then echo -e "On VLC: Empty.. [Nothing Playing]"
else
if [ "$NPV" == "/dev/video0" ];then echo -e "On VLC: Watching TV aka.. [IdiotBox]"
else
echo -e " $NPV "
fi
fi
