#!/usr/bin/env bash
#
# . ~/.bash_profile
#

[[ -f ~/.profile ]] && . ~/.profile

[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ -f ~/.bash_stuff/bash_exports ]] && . ~/.bash_stuff/bash_exports

eval $(ssh-agent)
# Bash_Env
#EDITOR="vim"
#PATH=$PATH:$HOME/bin
#BASH_ENV="$HOME/.bashrc"
#USERNAME="$(whoami)"

# auto startx and logout, security !
#if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/vc/1 ]]; then
# startx
# exec nohup startx > .xlog & vlock
# logout
#fi
#ssh-add

#export USERNAME BASH_ENV PATH EDITOR

alias startx='startx &> ~/.Xlog'
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
