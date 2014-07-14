#!/bin/bash

if [ "$(pidof shell-fm)" ]
then
    echo On
else
    echo Off
fi
