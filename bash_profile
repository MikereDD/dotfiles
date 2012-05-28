#!/bin/bash
#
# . ~/.bash_profile
#

# ssh-gent
eval $(ssh-agent)

# Bash_Env
BASH_ENV="$HOME/.bashrc"
USERNAME="$(whoami)"

# Sourcing ~/.profile & ~/.bashrc is a good thing
#profile
[ -f ~/.profile ] && source $HOME/.profile
#bashrc
[ -f ~/.bashrc ] && source $HOME/.bashrc

# auto startx and logout, security !
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/vc/1 ]]; then
#  startx
   exec nohup startx > .xlog & vlock
  logout
fi
ssh-add
