#!/bin/sh
# Variables
NPV=$(ps aux | grep vlc | grep Sl | awk '{ print $12 }' | sed 's/\(.*\)\..*/\1/')
#
if [ "$NPV" == "" ]; then
    echo -e "On VLC: Empty.. [Nothing Playing]"
elif [ "$NPV" == "v4l2:///dev/video0" ]; then
    echo -e " VLC: Watching TV aka.. [IdiotBox]"
elif [ "$NPV" = "v4l2:///dev/video1" ]; then
     echo -e " HDCam in use"
else
     echo -e " $NPV "
 fi
