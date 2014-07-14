#!/bin/bash

if [ "$(pidof pianobarfly)" ]
then
    echo On
else
    echo Off
fi
