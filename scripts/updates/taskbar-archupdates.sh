#!/bin/bash
# Taskbar Updates script
#  for WMii

# Run  pacman cron to fetch updates
#PACMANUPDATECRON="$HOME/apps/bin/cron-pacman-updates-sync-check.sh"

## Variables
# cat update(s) log
CHKUPDATES="$(cat -n $HOME/tmp/updates.log | tail -1 | awk '{print $1}')"

# Run
if [ "$CHKUPDATES" = "" ];then
   echo -e "Updates: 0" | wmiir create /rbar/eupdates
#   echo -e "No Updates" | wmiir create /rbar/eupdates
#   echo -e "Updates: 0"
else
   echo -e "Updates: $CHKUPDATES" | wmiir create /rbar/eupdates
#   echo -e "Updates: $CHKUPDATES"
fi
