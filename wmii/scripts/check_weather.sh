#!/bin/sh
CHECKWEATHER=$($HOME/.wmii/scripts/weather.sh 92707 | cut -f 1 -d ",")
echo "Weather: $CHECKWEATHER"
