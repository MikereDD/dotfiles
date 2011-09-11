#!/bin/bash
# Dumb Terminal Arch Linux System Info Dump
VER="0.3"
# http://dt.tehspork.com
# Dumb Terminal
#  Smaller than Life Projects
# Main Page: http://dt.tehspork.com
# Git Repo: https://github.com/dumbterminal/
# By: MikereDD & veekahn
# email: dumbterminal -at- tehspork.com
#
##
USER="$(whoami)"
HOSTNAME="$(uname -n)"
DISTRO="$(grep 'Arch' /etc/issue | cut -f1 -d '\')"
MACHINE="$(uname -m)"
KERNEL="$(uname -r)"
UPTIME="$(uptime | cut -f 2 -d "p" | cut -f 1 -d ",")"
SHELL="$SHELL"
TERM="$TERM"
EDITOR="$EDITOR"
BROWSER="$BROWSER"
PACKAGES="$(pacman -Q | wc -l)"
CPU="$(uname -p)"
MEMUSED=`free -mto | grep Mem | awk '{print $3}'`
MEMTOTAL=`free -mto | grep Total | awk '{print $2}'`
#HARDDISC=""
USBCAM="$(lsusb|grep Web|sed 's|Bus 002 Device 005: ID 046d:081b||g'|sed 's|, Inc.||g')"
KEYBOARD="$(lsusb|grep "Keyboard"|tail -1|sed 's|Bus 007 Device 004: ID 046d:c225||g'|cut -f1 -d '/'|sed 's|, Inc.||g' | awk '{print $7,$8}')"
MOUSE="Performance MX"
GPU="$(cat /var/log/Xorg.0.log | grep GPU | grep PCI | cut -f2 -d ':' | sed 's| at PCI||g' | sed 's|GPU ||g')"
SCRNRESOLUTION="$(xdpyinfo | grep dimensions | awk '{print $2}')"
WINDOWMANAGER="$(ps -A | awk '{print $4}' | grep wmii | head -1 | tr -d 'rc')"
HARDDISC="$(fdisk -l 2> /dev/null | grep Disk | grep -v identifier | awk '{print $3,$4}' | tr -d '\n' | sed 's|,|\ |g')"
AUDIOCARD="$(lspci|grep "Audio device" | cut -f2 -d '[' | tr -d ']' | sed 's|SB ||g')"
if [ "$TERM" = "tty" ]; then
    TERM="rxvt-unicode-256color"
else
    TERM="$TERM"
fi
echo -e "User: $USER - Hostname: $HOSTNAME - Distro: $DISTRO$MACHINE - Kernel: $KERNEL - Uptime:$UPTIME - Shell: $SHELL - Terminal: $TERM - Editor: $EDITOR - Browser: $BROWSER - Packages: $PACKAGES - CPU: $CPU Ram: "`expr $MEMUSED / 1024`"Mb" / "`expr $MEMTOTAL / 1024 - 1`"Gb" GPU: $GPU - Resolution: $SCRNRESOLUTION Audio: $AUDIOCARD Webcam:$USBCAM - Keyboard: $KEYBOARD - Mouse: $MOUSE - Window Manager: $WINDOWMANAGER - Harddisc: $HARDDISC"
