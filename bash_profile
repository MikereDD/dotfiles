#!/bin/bash
#
# . ~/.bash_profile
#

# Bash_Env
BASH_ENV="$HOME/.bashrc"
USERNAME="$(whoami)"

# Sourcing ~/.profile & ~/.bashrc is a good thing
#profile
[ -f ~/.profile ] && source $HOME/.profile
#bashrc
[ -f ~/.bashrc ] && source $HOME/.bashrc


