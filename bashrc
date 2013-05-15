#!/usr/bin/env bash
#---------------------------------------------
# file:     ~/.bashrc
# author:   Mike Redd - http://m-redd.com/
# vim:fenc=utf-8:nu:ai:si:et:ts=4:sw=4:ft=sh:
#---------------------------------------------

alias ssh='eval $(/usr/bin/keychain --eval --agents ssh -Q --quiet ~/.ssh/id_?sa*) && ssh'

# GPG Key
export GPGKEY=

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

## source files
# Bash Prompt
if [ -f ~/.bash_stuff/bash_prompt ]; then
    . ~/.bash_stuff/bash_prompt
else
    source ~/.git-prompt.sh
    PS1="[\u@\h \W] \n \$ "
fi

# pkgfile
[[ -f /usr/share/doc/pkgfile/command-not-found.bash ]] && . /usr/share/doc/pkgfile/command-not-found.bash
# bash_stuff - my bash files
[[ -f ~/.bash_stuff/bash_aliases ]] && . ~/.bash_stuff/bash_aliases
[[ -f ~/.bash_stuff/bash_binds ]] && . ~/.bash_stuff/bash_binds
[[ -f ~/.bash_stuff/bash_colors ]] && . ~/.bash_stuff/bash_colors
[[ -f ~/.bash_stuff/bash_completion ]] && . ~/.bash_stuff/bash_completion
[[ -f ~/.bash_stuff/bash_exports ]] && . ~/.bash_stuff/bash_completion
[[ -f ~/.bash_stuff/bash_exports ]] && . ~/.bash_stuff/bash_exports
[[ -f ~/.bash_stuff/bash_functions ]] && . ~/.bash_stuff/bash_functions
#if [ -d ~/.bash_stuff/ ]; then
#    source ~/.bash_stuff/bash_aliases
#    source ~/.bash_stuff/bash_binds
#    source ~/.bash_stuff/bash_colors
#    source ~/.bash_stuff/bash_completion
#    source ~/.bash_stuff/bash_exports
#    source ~/.bash_stuff/bash_functions
#fi

# ssh, ftp, etc, - my file
[[ -f ~/.bash_stuff/bash_sfs ]] && . ~/.bash_stuff/bash_sfs
# inputrc - my inputrc
[[ -f ~/.inputrc ]] && . ~/.inputrc
# colors - my dir_colors
[[ -f ~/.dir_colors ]] && eval `dircolors -b ~/.dir_colors`
# dmenu - my demnu
if [ -f ~/.dmenurc ]; then
    source ~/.dmenurc
else
    DMENU="dmenu"
fi

##################################

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

### linux console colors (jwr dark) ###

if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0000000" #black
    echo -en "\e]P85e5e5e" #darkgrey
    echo -en "\e]P18a2f58" #darkred
    echo -en "\e]P9cf4f88" #red
    echo -en "\e]P2287373" #darkgreen
    echo -en "\e]PA53a6a6" #green
    echo -en "\e]P3914e89" #darkyellow
    echo -en "\e]PBbf85cc" #yellow
    echo -en "\e]P4395573" #darkblue
    echo -en "\e]PC4779b3" #blue
    echo -en "\e]P55e468c" #darkmagenta
    echo -en "\e]PD7f62b3" #magenta
    echo -en "\e]P62b7694" #darkcyan
    echo -en "\e]PE47959e" #cyan
    echo -en "\e]P7899ca1" #lightgrey
    echo -en "\e]PFc0c0c0" #white
    clear # bring us back to default input colours
fi

export PYTHONPATH=/usr/lib/python3.3/site-packages/
