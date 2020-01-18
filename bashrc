#!/usr/bin/env bash
#---------------------------------------------
# file:     ~/.bashrc
# author:   Mike Redd - http://m-redd.com/
# vim:fenc=utf-8:nu:ai:si:et:ts=4:sw=4:ft=sh:
#---------------------------------------------

# locale export UTF-8
#export LC_ALL=en_US.UTF-8

# support path for Plex HomeTheater/MediaServer
#export XBMC_HOME=/usr/share/XBMC

# Start ssh-agent
#if ! pgrep -u "$USER" ssh-agent > /dev/null; then
#    ssh-agent > ~/.ssh-agent-thing
#fi
#if [[ ! "$SSH_AUTH_SOCK" ]]; then
#    eval "$(<~/.ssh-agent-thing)"
#fi

# force ssh to keycheck
#alias ssh='eval $(/usr/bin/keychain --eval --agents ssh -Q --quiet ~/.ssh/id_?sa*) && ssh'

# GPG Key
#export GPGKEY=

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# source /etc/bash.bashrc
[[ -f /etc/bash.bashrc ]] && . /etc/bash.bashrc
# source /etc/bash_completion.d/
if [ -d /etc/bash_completion.d/ ]; then
    for f in /etc/bash_completion.d/*; do
        . $f
    done
fi

# pkgfile
[[ -f /usr/share/doc/pkgfile/command-not-found.bash ]] && . /usr/share/doc/pkgfile/command-not-found.bash

# bash_stuff - my bash files
if [ -d ~/.bash_stuff/files/ ]; then
    for f in ~/.bash_stuff/files/*; do
        . $f
    done
fi

# dmenu - my demnu
if [ -f ~/.dmenurc ]; then
    source ~/.dmenurc
else
    DMENU="dmenu"
fi

##################################

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

### linux console colors (jwr dark) ###

if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0000000" #black
    echo -en "\e]P85e5e5e" #darkgrey
    echo -en "\e]P18a2f58" #darkred
    echo -en "\e]P9cf4f88" #red
    echo -en "\e]P2287373" #darkgreen
    echo -en "\e]PA53a6a6" #green
    echo -en "\e]P3914e89" #darkyellow
    echo -en "\e]PBbf85cc" #yellow
    echo -en "\e]P4395573" #darkblue
    echo -en "\e]PC4779b3" #blue
    echo -en "\e]P55e468c" #darkmagenta
    echo -en "\e]PD7f62b3" #magenta
    echo -en "\e]P62b7694" #darkcyan
    echo -en "\e]PE47959e" #cyan
    echo -en "\e]P7899ca1" #lightgrey
    echo -en "\e]PFc0c0c0" #white
    clear # bring us back to default input colours
fi

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

bash_prompt_command() {
    # How many characters of the $PWD should be kept
    local pwdmaxlen=25
    # Indicate that there has been dir truncation
    local trunc_symbol=".."
    local dir=${PWD##*/}
    pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))
    NEW_PWD=${PWD/#$HOME/\~}
    local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))
    if [ ${pwdoffset} -gt "0" ]
    then
        NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
        NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
    fi
}

bash_prompt() {
    case $TERM in
     xterm*|rxvt*)
         local TITLEBAR='\[\033]0;\u:${NEW_PWD}\007\]'
          ;;
     *)
         local TITLEBAR=""
          ;;
    esac
    local NONE="\[\033[0m\]"    # unsets color to term's fg color

    # Titlebar
    case ${TERM} in
        screen* )
            local TITLEBAR='\[\033k\w\033\134\]'
            ;;
        xterm*  )
            local TITLEBAR='\[\033]0;\u@\h: { \w }  \007\]'
            ;;
        *       )
            local TITLEBAR=''
            ;;
    esac

# Bash Prompt
if [ -f ~/.bash_stuff/prompt ]; then
    source ~/.git-completion.bash
    source ~/.git-prompt.sh
    source ~/.bash_stuff/prompt
else
    source ~/.git-completion.bash
    source ~/.git-prompt.sh
    PS1="${R}[${LG}\\u${R}@${LG}\h ${TQ}\\W${R}] \n ${TR}\\$ "
fi

}

# auto startx and logout, security !
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/vc/1 ]]; then
  startx
  logout
fi

PROMPT_COMMAND=bash_prompt_command
bash_prompt
unset bash_prompt

eval $(thefuck --alias)

# Lynx
export LYNX_CFG=$HOME/.lynx.cfg
export LYNX_LSS=$HOME/.lynx.lss

# Crosstool
#export PATH=${PATH}:${HOME}/tools/toolchains/crosstool-ng-linaro

# vim: set filetype=bash:
