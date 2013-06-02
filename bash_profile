#!/usr/bin/env bash
#--------------------------------------------
# file:     ~/.bash_profile
# author:   Mike Redd - http://m-redd.com/
# vim:fenc=utf-8:nu:ai:si:et:ts=4:sw=4:ft=sh:
#--------------------------------------------

[[ -f ~/.profile ]] && . ~/.profile
[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
    ssh-add
fi

alias sX='startx &> ~/.Xlog'

# startx if on tty1 and tmux on tty2
#if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
#    exec $sX -- vt1 &>/dev/null
#    logout
#elif [[ $(tty) = /dev/tty2 ]]; then
#    tmux -f $HOME/.tmux.conf new -s secured
#fi

# vim: set filetype=bash:
