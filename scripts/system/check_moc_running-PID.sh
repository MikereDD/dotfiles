#!/bin/bash

if [ "$(pidof mocp)" ]
then
    echo On
else
    echo Off
fi
