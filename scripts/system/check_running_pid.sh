#!/bin/bash


APPNAME=$1
if [ -z "$APPNAME" ]; then
  echo "Please provide a process to check if running"
else
  unset response
if [ "$(pidof $APPNAME)" ]
then
    echo On
else
    echo Off
fi
fi
