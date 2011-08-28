#!/bin/bash
#
# Simple script to mount SSHFS shares

# Variables
## User
USER=""
## Domian Address or IP
DOMAINORIP=""
## Port
PORT=""
# Path to Books, Music, Animated, TV, Movies directories I use.
## Books
# Local
LBOOKS="$HOME/Books"
# Host
HBOOKS=""
## Music
# Local
LMUSIC="$HOME/Music"
# Host
HMUSIC=""
## Animted
# Local
LANIMATED="$HOME/Video/Animated"
# Host
HANIMATED=""
## TV
# Local
LTV="$HOME/Video/TV"
# Host
HTV=""
## Movies
# Local
LMOVIES="$HOME/Video/Movies"
# Host
HMOVIES=""

# network shares
## Books
BOOKS=$(ls $LBOOKS)
if [ "$BOOKS" != "" ];then
   echo "Books dir was mounted"
else
   echo -e `sshfs "$USER"@"$DOMAINORIP":"$HBOOKS" "$LBOOKS" -C -p "$PORT"`
fi
## Music
MUSIC=$(ls $LMUSIC)
if [ "$MUSIC" != "" ];then
   echo "Music dir was mounted"
else
   echo -e `sshfs "$USER"@"$DOMAINORIP":"$HMUSIC" "$LMUSIC" -C -p "$PORT"`
fi
## Animated
ANIMATED=$(ls $LANIMATED)
if [ "$ANIMATED" != "" ];then
    echo "Animated dir was mounted"
else
    echo -e `sshfs "$USER"@"$DOMAINORIP":"$HANIMATED" "$LANIMATED" -C -p "$PORT"`
fi
## TV
TV=$(ls $LTV)
if [ "$TV" != "" ];then
    echo "TV dir was mounted"
else
    echo -e `sshfs "$USER"@"$DOMAINORIP":"$HTV" "$LTV" -C -p "$PORT"`
fi
## Movies
MOVIES=$(ls $LMOVIES)
if [ "$MOVIES" != "" ];then
    echo "Movies dir was mounted"
else
    echo -e `sshfs "$USER"@"$DOMAINORIP":"$HMOVIES" "$LMOVIES" -C -p "$PORT"`
fi
