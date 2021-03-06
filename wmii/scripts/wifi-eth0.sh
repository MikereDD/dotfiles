#!/bin/bash
# wlan0 / eth0
# by: MreDD
#######
#
# Variables
##
# Wifi
interfaceW="wlan0"
wlanOCard=$(lspci | grep Wireless | awk '{print $4,$7,$8,$11}')
#wtinetin=$(ifconfig $interfaceW | grep bytes | awk '/TX bytes/ {print $3$4}' | sed 's/bytes://')
wtinetin=$(ifconfig $interfaceW | grep bytes | awk '/RX packet/ {print $6,$7}')
#wtinetout=$(ifconfig $interfaceW | grep bytes | awk '/TX bytes/ {print $7$8}' | sed 's/bytes://')
wtinetout=$(ifconfig $interfaceW | grep bytes | awk '/TX packet/ {print $6,$7}')
ssid=$(iwgetid | cut -f 2 -d '"')
# Eth0
interfaceE="eth0"
eth0card=$(lspci | grep Ethernet | awk '{print $4,$9,$10,$11}')
#etinein=$(ifconfig $interfaceE | grep bytes | awk '/TX bytes/ {print $3$4}' | sed 's/bytes://')
etinein=$(ifconfig $interfaceE | grep bytes | awk '/RX packet/ {print $6,$7}')
#etineout=$(ifconfig $interfaceE | grep bytes | awk '/TX bytes/ {print $7$8}' | sed 's/bytes://')
etineout=$(ifconfig $interfaceE | grep bytes | awk '/RX packet/ {print $6,$7}')
ip=$(wget -q -O - api.myiptest.com | awk -F"\"" '{print $4}')

if [ "$ssid" != "" ]; then
      echo -e "essid: $ssid In: $wtinetin Out: $wtinetout" | wmiir create /rbar/bnetinfo
  elif [ "$ip" != "" ]; then
      echo -e "wired: $ip In: $etinein Out: $etineout" | wmiir create /rbar/bnetinfo
  else
      echo -e ":-: No Interwebz :-:" | wmiir create /rbar/bnetinfo
fi

