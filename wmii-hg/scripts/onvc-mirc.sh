#!/bin/sh
# Now Playing On VLC
# http://script.m-redd.com
# Smaller than Life Projects
# By: MreDD
# projects - at - 0tue0 (dot) com
## 
# [READ NEXT TWO LINES]
##
#############################################
# Colors
# Forground
W='\x0300' # White
K='\x0301' # Black
B='\x0302' # Blue (Navy)
G='\x0303' # Green
R='\x0304' # Red
BN='\x0305' # Brown (Maroon)
P='\x0306' # Purple
O='\x0307' # Orange
Y='\x0308' # Yellow
LG='\x0309' # Lt. Green
T='\x0310' # Teal
LC='\x0311' # Lt. Cyan
LB='\x0312' # Lt. Blue
PN='\x0313' # Pink
GY='\x0314' # Grey
LGY='\x0315' # Lt. Grey
# Background
BW=',00' # Background White
BK=',01' # Background Black
BB=',02' # Background Blue
BG=',03' # Background Green
BR=',04' # Background Red
BBN=',05' # Background Brown (Maroon)
BP=',06' # Background Purple
BO=',07' # Background Orange
BY=',08' # Background Yellow
BLG=',09' # Background Lt. Green
BT=',10' # Background Teal
BLC=',11' # Background Lt. Cyan
BLC=',12' # Background Lt. Blue
BPN=',13' # Background Pink
BGY=',14' # Background Grey
BLGY=',15' # Background Lt. Grey
# Various
BLD='\x02' # Bold
UL='\x1f' # Underlined
FL='\x06' # Flashing
RT='\x03\x02\x02' # Reset Text
# Variables
NPV=$(ps x | grep vlc | head -1 | awk '{print $6}' | head -1 | sed 's/\(.*\)\..*/\1/')
#
if [ "$NPV" == "" ];then echo -e "${W}On VLC${K}: ${LGY} Empty.. ${R}[${LGY}Nothing Playing${R}]"
else
if [ "$NPV" == "/dev/video0" ];then echo -e "${W}On VLC${K}: ${LB}Watching TV aka.. ${R}[${LGY}IdiotBox${R}]"
else
echo -e "${W}On VLC${GY}: ${O}$NPV "
fi
fi
