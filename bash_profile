#!/bin/bash
#
# . ~/.bash_profile
#

# Bash shell driver for 'go' (http://code.google.com/p/go-tool/).
function go {
    export GO_SHELL_SCRIPT=$HOME/.__tmp_go.sh
    python2 -m go $*
    if [ -f $GO_SHELL_SCRIPT ] ; then
        source $GO_SHELL_SCRIPT
    fi
    unset GO_SHELL_SCRIPT
}

# TMP
export TMPDIR="$HOME/tmp"
# Editor
export EDITOR="vim"
# Browser
if [ -n "$DISPLAY" ]; then
    BROWSER="chromium"
else
    BROWSER="elinks"
fi
# Pager
export PAGER="vimpager"
# History
export HISTCONTROL="ignoreboth"
# SDL Audio
export SDL_AUDIODRIVER="alsa"
# Display
export DISPLAY=:0.0
# Screen hack
export SDL_VIDEO_FULLSCREEN_HEAD=1
# Path
PATH="$PATH:$HOME/apps/bin:."
# Bash_Env
BASH_ENV="$HOME/.bashrc"
USERNAME="$(whoami)"
export USERNAME BASH_ENV PATH

# Sourcing ~/.bashrc is a good thing
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

## Start X
if [[ -z $DISPLAY && $(tty) = /dev/tty1 ]]; then
    exec startx
#    exec xinit -- /usr/bin/X -nolisten tcp vt7
fi
