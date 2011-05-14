#!/bin/sh
# wlan0 / eth0
# by: MreDD
#######
#

# Variables
interfaceW="wlan0"
wlanOCard=$(lspci | grep Wireless | awk '{print $4,$7,$8,$11}')
wtinetin=$(ifconfig $interfaceW | grep bytes | awk '/TX bytes/ {print $3$4}' | sed 's/bytes://')
wtinetout=$(ifconfig $interfaceW | grep bytes | awk '/TX bytes/ {print $7$8}' | sed 's/bytes://')
ssid=$(iwgetid | cut -f 2 -d '"')
if [ "$ssid" == "B0rked" ]; then
      echo -e "essid: $ssid In: $wtinetin Out: $wtinetout"
else
      echo -e "wifi: OFF"
fi

