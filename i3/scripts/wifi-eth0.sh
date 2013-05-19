#!/bin/bash
#---------------------------------------------
# file:     ~/.i3/scripts/wifi-eth0.sh
# author:   Mike Redd - http://m-redd.com/
# vim:fenc=utf-8:nu:ai:si:et:ts=4:sw=4:ft=sh:
#---------------------------------------------

# Variables
##
# Wifi
interfaceW="wlan0"
wlanOCard=$(lspci | grep Wireless | awk '{print $4,$7,$8,$11}')
#wtinetin=$(ifconfig $interfaceW | grep bytes | awk '/RX bytes/ {print $3$4}' | sed 's/bytes://')
wtinetin=$(ifconfig $interfaceW | grep bytes | awk '/RX packet/ {print $6,$7}')
#wtinetout=$(ifconfig $interfaceW | grep bytes | awk '/TX bytes/ {print $7$8}' | sed 's/bytes://')
wtinetout=$(ifconfig $interfaceW | grep bytes | awk '/TX packet/ {print $6,$7}')
ssid=$(iwgetid | cut -f 2 -d '"')
# Eth0
interfaceE="eth0"
eth0card=$(lspci | grep Ethernet | awk '{print $4,$9,$10,$11}')
#etinein=$(ifconfig $interfaceE | grep bytes | awk '/RX bytes/ {print $3$4}' | sed 's/bytes://')
etinein=$(ifconfig $interfaceE | grep bytes | awk '/RX packet/ {print $6,$7}')
#etineout=$(ifconfig $interfaceE | grep bytes | awk '/TX bytes/ {print $7$8}' | sed 's/bytes://')
etineout=$(ifconfig $interfaceE | grep bytes | awk '/TX packet/ {print $6,$7}')
#ip=$(wget -q -O - api.myiptest.com | awk -F"\"" '{print $4}')
#ip=$(wget -q -O - checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//' > ~/.public_ip.txt)
catip=$(cat ~/.public_ip.txt)
localip=$(ip addr | egrep "inet" | egrep "eth0" | cut -f1 -d '/' | awk '{print $2}')
localwifiip=$(ip addr | egrep "inet" | egrep "wlan0" | cut -f1 -d '/' | awk '{print $2}')

if [ "$catip" == "*.*.*.*" ];then
    catip="No *.*.*.* IP"
fi

if [ "$ssid" != "" ]; then
      echo -e "essid: $ssid In: $wtinetin Out: $wtinetout pip: $catip"
      sleep 35
      echo -e "lip/essid: ${localwifiip}/${ssid} In: $wtinetin Out: $wtinetout"
      sleep 5
  elif [ "$ip" != "" ]; then
      echo -e "lip/pip: ${localip}/${ip} In: $etinein Out: $etineout"
  else
      echo -e ":-: No Interwebz :-:"
fi

