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
wtinetin=$(ifconfig $interfaceW | grep bytes | awk '/TX bytes/ {print $3$4}' | sed 's/bytes://')
wtinetout=$(ifconfig $interfaceW | grep bytes | awk '/TX bytes/ {print $7$8}' | sed 's/bytes://')
ssid=$(iwgetid | cut -f 2 -d '"')
# Eth0
interfaceE="eth0"
eth0card=$(lspci | grep Ethernet | awk '{print $4,$9,$10,$11}')
etinein=$(ifconfig $interfaceE | grep bytes | awk '/TX bytes/ {print $3$4}' | sed 's/bytes://')
etineout=$(ifconfig $interfaceE | grep bytes | awk '/TX bytes/ {print $7$8}' | sed 's/bytes://')
ip=$(wget -q -O - api.myiptest.com | awk -F"\"" '{print $4}')
localip=$(ip addr | egrep "inet" | egrep "wlan0|eth0" | cut -f1 -d '/' | awk '{print $2}')

if [ "$ssid" == "b0rked" ]; then
      echo -e "essid: $ssid In: $wtinetin Out: $wtinetout" | wmiir create /rbar/bnetinfo
      sleep 40
      wmiir remove /rbar/bnetinfo
      echo -e "local: $localip" | wmiir create /rbar/bnetinfo
      sleep 5
  elif [ "$ip" != "" ]; then
      echo -e "wired: $ip In: $etinein Out: $etineout" | wmiir create /rbar/bnetinfo
      sleep 40
      wmiir remove /rbar/bnetinfo
      echo -e "local: $localip" | wmiir create /rbar/bnetinfo
      sleep 5
  else
      echo -e ":-: No Interwebz :-:" | wmiir create /rbar/bnetinfo
fi

