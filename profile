#!/usr/bin/env bash
#--------------------------------------------
# file:     ~/.profile
# author:   Mike Redd - http://m-redd.com/
# vim:fenc=utf-8:nu:ai:si:et:ts=4:sw=4:ft=sh:
#--------------------------------------------

# source .bashrc               
case "$-" in *i*) if [ -r ~/.bashrc ]; then . ~/.bashrc; fi;; esac

# setup environment
export LESS=FX
export LC_ALL=
export LC_COLLATE="C"
export EDITOR=vim
export FCEDIT=vim
export VISUAL=$EDITOR
export SUDO_EDITOR="/usr/bin/vim"
export BROWSER=/usr/bin/dwb
#export http_proxy="http://127.0.0.1:8118"
#export https_proxy="http://127.0.0.1:8118"

# export other directories to PATH
PATH=$PATH:/home/typezero/Scripts:/home/typezero/bin:/usr/lib/surfraw/

# start keychain
#/usr/bin/keychain -Q -q --nogui id_rsa id_dsa alioth bb B1BD4E40
#[ -f $HOME/.keychain/${HOSTNAME}-sh ] && source $HOME/.keychain/${HOSTNAME}-sh
#[ -f $HOME/.keychain/${HOSTNAME}-sh-gpg ] && source $HOME/.keychain/${HOSTNAME}-sh-gpg

# startx if on tty1 and tmux on tty2
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec startx -- vt1 &>/dev/null
    logout
elif [[ $(tty) = /dev/tty2 ]]; then
    tmux -f $HOME/.tmux/conf new -s secured
fi
