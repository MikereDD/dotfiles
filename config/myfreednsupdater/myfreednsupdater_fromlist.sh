#!/bin/bash
# My FreeDNSUpdater from Text file
# Simple DNS Updater for FreeDNS
#  use script to update dynamic-dns from FreeDNS http://freedns.afraid.org/
# by: Mike Redd
VER=0.1
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                    Version 2, December 2004
#
# Copyright (C) 2011 Mike Redd <mredd@0tue0.com>
#
# Everyone is permitted to copy and distribute verbatim or modified
# copies of this license document, and changing it is allowed as long
# as the name is changed.
#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.


# Script uses:
# WGet - http://www.gnu.org/software/wget/

# Checks
if [[ -z $( type -p wget ) ]]; then
    echo -e "wget -- NOT INSTALLED !";exit
fi

# Domain list
DOMAINLIST="$HOME/.config/myfreednsupdater/domainlist.txt"

# IP Check
YOURIP="$(wget -q -O - api.myiptest.com | awk -F"\"" '{print $4}')"
# Logs directory
LOGSDIR="$HOME/.config/myfreednsupdater/logs"

for i in 1 2 3 4 5 6 7 
do

HOSTADDY=$(awk NR==$i $DOMAINLIST | awk '{ print $1 }')
DOMAIN=$(`which host` $HOSTADDY | head -1 | awk '{ print $1 }')
URLIP=$(`which host` $HOSTADDY | head -1 | awk '{ print $4 }')
HASHPASS=$(awk NR==$i $DOMAINLIST | awk '{ print $2 }')

if [ $YOURIP != $URLIP ];then
   echo "$DOMAIN - DNS needs to be Updated"
   sleep 1
   echo -e "$(wget -q --read-timeout=0.0 --waitretry=5 --tries=25 --background -O $LOGSDIR/$DOMAIN.log http://freedns.afraid.org/dynamic/update.php?$HASHPASS)"
   sleep 1
else
   echo -e "$DOMAIN - No DNS Update needed"
fi
done
