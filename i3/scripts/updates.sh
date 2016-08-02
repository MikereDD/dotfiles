#!/bin/bash

Update=$(checkupdates | cut -d " " -f1 | wc -l)

if [ "$Update" = "0" ];then
    echo -e "<span font_desc='OpenLogos'>B</span>"
else
    echo -e "$Update <span font_desc='OpenLogos'>B</span>"
fi
