#!/bin/bash
# Random Background for rxvt for MOC
BGI="$(ls $HOME/images/wallpapers/rxvt-random | sort -R | tail -1)"
urxvt -pixmap $HOME/images/wallpapers/rxvt-random/$BGI\;98:110 -title MOC -fn 'xft:lime:pixelsize=10:antialias=true:hinting=true' -e mocp
