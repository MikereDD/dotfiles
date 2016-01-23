#!/bin/bash
#---------------------------------------------
# file:     ~/.i3/scripts/checkmail.sh
# author:   Mike Redd - http://m-redd.com/
# vim:fenc=utf-8:nu:ai:si:et:ts=4:sw=4:ft=sh:
#---------------------------------------------

 INBOX=$1
 USER=""
 PASSWD=""

 INBOXNUM=`curl -u "$USER":"$PASSWD" --silent https://mail.google.com/mail/feed/atom/$INBOX | grep 'fullcount' | sed -e 's/<[^>]*>//g'`

 #| grep -o '[0-9]\+'`

 if [ "$INBOXNUM" == "0" ]; then
  #notify-send GMail "0 new emails"
  echo -e "0" > ~/.adminlh-mail.txt
 else
  #notify-send GMail "$INBOXNUM New Messages in $FOLDER"
  echo -e "$INBOXNUM" > ~/.adminlh-mail.txt
 fi
