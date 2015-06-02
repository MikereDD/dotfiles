#!/bin/bash

if [ "$(pidof spotify)" ]
then
    echo On
else
    echo Off
fi
