#!/bin/bash
# updates

echo -e "Updates: $(perl $HOME/scripts/conky-scripts/updates/arch-updates/conky-updates.pl)" | wmiir create /rbar/eupdates
