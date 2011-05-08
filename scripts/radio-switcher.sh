#!/bin/bash
# Radio - Switcher
# By: MreDD
##

# Colors
# Forground
K='\E[0;30m' # Black - Regular
R='\E[0;31m' # Red
G='\E[0;32m' # Green
Y='\E[0;93m' # Yellow
B='\E[0;34m' # Blue
P='\E[0;35m' # Purple
C='\E[0;36m' # Cyan
W='\E[0;37m' # White
O='\E[0;33m' # Orange
# Bold
BK='\E[1;30m' # Black - Bold
BR='\E[1;31m' # Red
BG='\E[1;32m' # Green
BY='\E[1;93m' # Yellow
BB='\E[1;34m' # Blue
BP='\E[1;35m' # Purple
BC='\E[1;36m' # Cyan
BW='\E[1;37m' # White
BO='\E[1;33m' # Orange
# Underline
UK='\E[4;30m' # Black - Underline
UR='\E[4;31m' # Red
UG='\E[4;32m' # Green
UW='\E[4;93m' # Yellow
UB='\E[4;34m' # Blue
UP='\E[4;35m' # Purple
UC='\E[4;36m' # Cyan
UW='\E[4;37m' # White
UO='\E[4;33m' # Orange
# Background
BGK='\E[40m'   # Black - Background
BGR='\E[41m'   # Red
BGG='\E[42m'   # Green
BGY='\E[93m'   # Yellow
BGB='\E[44m'   # Blue
BGP='\E[45m'   # Purple
BGC='\E[46m'   # Cyan
BGW='\E[47m'   # White
BGO='\E[33m'   # Orange
TR='\E[0m'    # Text Reset

#error handling
error_msg(){
    echo "$PROG: ERROR: $*" | fold >&2
    }

#check for shell-fm
which shell-fm >/dev/null 2>&1 ||
{ error_msg "Cannot find 'shell-fm', which is needed for this script."
          exit 1;}

#check for pianobar
which pianobar >/dev/null 2>&1 ||
{ error_msg "Cannot find 'pianobar', which is needed for this script."
          exit 1;}

menu ()
{
#The Menu
        

clear;

        echo -e "${W}-${C}RadioSwitcher${W}-"
        echo -e "${W}----${K}${BGW}MENU${TR}${W}----"
        echo ""
        echo -e "${G}0 ${R}Exit"
        echo -e "${G}1 ${C}Pandora"
        echo -e "${G}2 ${M}LastFM"
        echo ""
        echo ""
}
        menu
echo -e "${M}Hello ${P}$(whoami)${TR}${M}, "
read -p "Which Streaming Radio Player? " choice
       
        while [[ "$choice" != "0" ]]
        do
case $choice in
             0) clear;
                 echo "${M}Thanks ${P}$(whoami)${W}!"
                 echo "${M}GoodBye${W}..."
                 exit;
                 ;;
             1) clear;
         
                 pianobar;
echo ""
echo -e "$(pkill -9 pianobar)"
echo -e "${R}CTRL${W}+${O}c ${M}to Exit ${W}- "
read -p "${C}Press Enter to Return to the Menu." deadArg;
                 ;;
             2) clear;
         
                 shell-fm;
echo ""
echo -e "$(pkill -9 shell-fm)"
echo -e "${R}CTRL${W}+${O}c ${M}to Exit ${W}- "
read -p "${C}Press Enter to Return to the Menu." deadArg;
                 ;;
esac

# menu again
   
menu
   echo -e "${M}Hello ${P}$(whoami)${TR}${M}, "
   read -p "Which Streaming Radio Player? " choice
      done 
