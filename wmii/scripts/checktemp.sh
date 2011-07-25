#!/bin/sh
#

# CPU
COREONE="$(sensors | grep "Core 0" | cut -c16-18 | cut -f 1 -d ".")"
CORETWO="$(sensors | grep "Core 1" | cut -c16-18 | cut -f 1 -d ".")"
CORETHREE="$(sensors | grep "Core 2" | cut -c16-18 | cut -f 1 -d ".")"
COREFOUR="$(sensors | grep "Core 3" | cut -c16-18 | cut -f 1 -d ".")"

# Video Card
GFX="$(nvidia-settings -q GPUCoreTemp | grep '):' | awk '{print $4}' | cut -f 1 -d ".")"

# Harddisk
GETHDTEMP="$(nc localhost 7634 | sed 's|dev|\n|g')"
echo -e "$GETHDTEMP" > $HOME/.hddtemp.txt
HDA="$(cat ~/.hddtemp.txt | grep "sda" | tr -d '/' | sed 's/sda|WDC WD15EARS-00MVWB0//g' | cut -f2 -d "|")"
HDB="$(cat ~/.hddtemp.txt | grep "sdb" | tr -d '/' | sed 's/sdb|Hitachi HDP725032GLA360//g' | cut -f2 -d "|")"
HDC="$(cat ~/.hddtemp.txt | grep "sdc" | tr -d '/' | sed 's/sdc|WDC WD10EACS-00D6B1//g' | cut -f2 -d "|")"
HDD="$(cat ~/.hddtemp.txt | grep "sdd" | tr -d '/' | sed 's/sdd|WDC WD10EACS-00D6B1//g' | cut -f2 -d "|")"

# 
echo -e "C0: $COREONE° C1: $CORETWO° C2: $CORETHREE° C3: $COREFOUR° Gfx: $GFX° HDA: $HDA° HDB: $HDB° HDC: $HDC° HDD: $HDD°" | wmiir create /rbar/achecktemp

sleep 5

wmiir remove /rbar/achecktemp

sleep 40
