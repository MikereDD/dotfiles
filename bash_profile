#!/bin/bash
#
# . ~/.bash_profile
#

# Bash_Env
#EDITOR="vim"
#PATH=$PATH:$HOME/bin
#BASH_ENV="$HOME/.bashrc"
#USERNAME="$(whoami)"

# Sourcing ~/.profile & ~/.bashrc is a good thing
#profile
#[ -f ~/.profile ] && source $HOME/.profile
#bashrc
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

 # auto startx and logout, security !
#if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/vc/1 ]]; then
#  startx
#   exec nohup startx > .xlog & vlock
#  logout
#fi
#ssh-add

#export USERNAME BASH_ENV PATH EDITOR
