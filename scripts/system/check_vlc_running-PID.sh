#!/bin/bash

if [ "$(pidof vlc)" ]
then
    echo On
else
    echo Off
fi
