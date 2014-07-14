#!/bin/bash

if [ "$(pidof mplayer)" ]
then
    echo On
else
    echo Off
fi
