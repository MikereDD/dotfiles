#!/usr/bin/env bash
#--------------------------------------------
# file:     ~/.bash_profile
# author:   Mike Redd - http://m-redd.com/
# vim:fenc=utf-8:nu:ai:si:et:ts=4:sw=4:ft=sh:
#--------------------------------------------

[[ -f ~/.profile ]] && . ~/.profile
[[ -f ~/.bashrc ]] && . ~/.bashrc

# start keychain
#/usr/bin/keychain -Q -q --nogui id_rsa id_dsa alioth bb B1BD4E40
#[ -f $HOME/.keychain/${HOSTNAME}-sh ] && source $HOME/.keychain/${HOSTNAME}-sh
#[ -f $HOME/.keychain/${HOSTNAME}-sh-gpg ] && source $HOME/.keychain/${HOSTNAME}-sh-gpg
# check ssh-agent add keys with ssh-add
if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
    ssh-add
fi

alias sX='startx &> ~/.Xlog'

# auto startx and logout, security !
#if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/vc/1 ]]; then
# exec nohup $sX > .xlog & slock
# logout
#fi

#export USERNAME BASH_ENV PATH EDITOR 
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

# startx if on tty1 and tmux on tty2
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec $sX -- vt1 &>/dev/null
    logout
elif [[ $(tty) = /dev/tty2 ]]; then
    tmux -f $HOME/.tmux.conf new -s secured
fi

# vim: set filetype=bash:
