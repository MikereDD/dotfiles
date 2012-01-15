#!/bin/bash
# arch linux updates

# Run  pacman cron to fetch updates
#PACMANUPDATECRON="/etc/cron.hourly/pacman-update-sync-check_cron.sh"

## Variables
# cat update(s) log
CHKUPDATES="$(cat -n /home/$USER/tmp/updates.log | tail -1 | awk '{print $1}')"

# Run
if [ "$CHKUPDATES" = "" ];then
   echo -e "Updates: 0" | wmiir create /rbar/eupdates
#   echo -e "No Updates" | wmiir create /rbar/eupdates
#   echo -e "Updates: 0"
else
   echo -e "Updates: $CHKUPDATES" | wmiir create /rbar/eupdates
#   echo -e "Updates: $CHKUPDATES"
fi
