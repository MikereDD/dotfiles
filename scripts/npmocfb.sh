#!/bin/bash
#
# Post Now Playing MOC - Music On Console
# on Facebook
# by: MreDD
#
INFO=`mocp -i`
STATE=`mocp -i | grep State`
ARTIST=`mocp -i | grep Artist | cut -f2 -d ":"`
TITLE=`mocp -i | grep SongTitle | cut -f2 -d ":"`
#ALBUM=`mocp -i | grep Album | cut -f2 -d ":"`
CT=`mocp -i | grep 'CurrentTime' | awk '{print $2}'`
TT=`mocp -i | grep 'TotalTime' | awk '{print $2}'`
NOWPLAY="is listening to... $ARTIST -$TITLE "["$CT/$TT"]" "
echo -e $NOWPLAY &> /dev/null
if [ "$NOWPLAY" = "" ];then
    echo "Nothing to Post on Facebook."
    exit 0
else
    echo "Posting Now Playing Status on Facebook"
    fbcmd post "$NOWPLAY"
fi
