#!/usr/bin/env bash
#--------------------------------------------
# file:     $HOME/.bash_profile
# author:   Mike Redd - http://git.m-redd.com
# modified: Fri Dec 28 18:23:22 CST 2018
# vim:fenc=utf-8:nu:ai:si:et:ts=4:sw=4:ft=sh:
#--------------------------------------------

# Source files
[[ -f ~/.profile ]] && . ~/.profile
[[ -f ~/.bashrc ]] && . ~/.bashrc

# SSH agent
if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
    ssh-add
fi

# Aliases
alias STARTX='startx &> $HOME/log/Xlog-$(date +'%F-%k-%M-%S')'

# startx on login
#if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#  exec startx
#fi

# startx if on tty1 and tmux on tty2
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
    $STARTX -- vt1 &>/dev/null
    logout
elif [[ $(tty) = /dev/tty2 ]]; then
    tmux -f $HOME/.tmux.conf new -s secured
fi

# vim: set filetype=bash:
