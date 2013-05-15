#!/usr/bin/env bash
#--------------------------------------------
# file:     ~/.bash_profile
# author:   Mike Redd - http://m-redd.com/
# vim:fenc=utf-8:nu:ai:si:et:ts=4:sw=4:ft=sh:
#--------------------------------------------

[[ -f ~/.profile ]] && . ~/.profile

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Bash_Env
export EDITOR="vim"
export GIT_EDITOR="vim"
#PATH=$PATH:$HOME/bin
#BASH_ENV="$HOME/.bashrc"
#USERNAME="$(whoami)"

# auto startx and logout, security !
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/vc/1 ]]; then
 startx
 exec nohup startx > .xlog & slock
 logout
fi

alias startx='startx &> ~/.Xlog'
#export USERNAME BASH_ENV PATH EDITOR 
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

#ssh-add
if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
    ssh-add
fi
