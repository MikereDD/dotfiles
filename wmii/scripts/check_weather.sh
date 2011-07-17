#!/bin/sh
CHECKWEATHER=$($HOME/.wmii/scripts/weather.sh ***** | cut -f 1 -d ",")
echo "Weather: $CHECKWEATHER"
