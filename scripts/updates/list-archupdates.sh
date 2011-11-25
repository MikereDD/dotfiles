#!/bin/bash
#
# Simple script to dump a list of packages that are ready for updates.
#  for Arch Linux.

# Color
# regular colors
K="\033[0;30m"    # black
R="\033[0;31m"    # red
G="\033[0;32m"    # green
Y="\033[0;33m"    # yellow
B="\033[0;34m"    # blue
M="\033[0;35m"    # magenta
C="\033[0;36m"    # cyan
W="\033[0;37m"    # white
O="\e[0;33m"    # orange
P="\e[0;35m"    # purple
LG="\e[0;37m"   # lightgray
DG="\e[0;90m"   # darkgray
GL="\e[0;92m"   # lightgreen
LR="\e[0;91m"   # lightred
LP="\e[0;95m"   # lightpurple
TQ="\e[0;96m"   # tourquoise

# emphasized (bolded) colors
EMK="\033[1;30m"  # black
EMR="\033[1;31m"  # red
EMG="\033[1;32m"  # green
EMY="\033[1;33m"  # yellow
EMB="\033[1;34m"  # blue
EMM="\033[1;35m"  # magenta
EMC="\033[1;36m"  # cyan
EMW="\033[1;37m"  # white
EMO="\e[1;43m"  # orange
EMP="\e[1;105m"  # purple

# background colors
BGK="\033[40m"  # black
BGR="\033[41m"  # red
BGG="\033[42m"  # green
BGY="\033[43m"  # yellow
BGB="\033[44m"  # blue
BGM="\033[45m"  # magenta
BGC="\033[46m"  # cyan
BGW="\033[47m"  # white
BGW="\e[1;43m"  # orange
BGW="\e[1;45m"  # purple
BGGR="\e[0;90m"
#UC=$W               # user's color
TR="\e[0m"      # Text Reset

[ $UID -eq "0" ] && UC=$R   # root's color

# Variables
DUMPLIST="$(cat $HOME/tmp/updates.log | sed 's/x86_64/ /' | cut -f 2 -d ' ' | sed 's/x86_64/ /' | sed 's/any/ /' | cut -f 1 -d ' ' | sed 's/...$/ /' | tr -d '/' | tr -d '\n' | fold -s -w 65)"
TOTALUPDATES="$(cat -n $HOME/tmp/updates.log | awk '{print $1}' | tail -1)"

if [ "$TOTALUPDATES" = "" ];then
   echo -e " ${Y}(${LG}0${Y}) ${Y}:${LR}Package Updates${Y}: "
else
   echo -e " ${Y}(${LG}$TOTALUPDATES${Y}) ${Y}:${LR}Package${Y}(${LR}s${Y}) ${LR}Have Updates${Y}: "
   echo -e "${TQ}${DUMPLIST}"
fi
