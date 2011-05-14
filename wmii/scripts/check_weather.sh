#!/bin/sh
CHECKWEATHER=$($HOME/.wmii/scripts/weather.sh ZIPCODE | cut -f 1 -d ",")
echo "Weather: $CHECKWEATHER"
