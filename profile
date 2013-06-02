#!/usr/bin/env bash
#--------------------------------------------
# file:     ~/.profile
# author:   Mike Redd - http://m-redd.com/
# vim:fenc=utf-8:nu:ai:si:et:ts=4:sw=4:ft=sh:
#--------------------------------------------

# setup environment
export LESS="FX"
export LC_ALL=
export LC_COLLATE="C"
export EDITOR="vim"
export FCEDIT="vim"
export GIT_EDITOR="vim"
export VISUAL="$EDITOR"
export SUDO_EDITOR="/usr/bin/vim"
export BROWSER="/usr/bin/dwb"
#export http_proxy="http://127.0.0.1:8118"
#export https_proxy="http://127.0.0.1:8118"
#BASH_ENV="$HOME/.bashrc"
#USERNAME="$(whoami)"
# export other directories to PATH
#PATH=$PATH:/home/typezero/Scripts:/home/typezero/bin:/usr/lib/surfraw/

eval $(sh /etc/profile.d/gpg-agent.sh)

# vim: set filetype=bash:
