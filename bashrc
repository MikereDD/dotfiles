#!/usr/bin/env bash
#
# . ~/.bashrc
#
# Mike Redd <mredd -at- 0tue0 -dot- com>
# 

# source system and or user files
# bashrc - system
if [ -f /etc/bash.bashrc ]; then
      . /etc/bash.bashrc
fi

# bash-completion - system
if [ -d /etc/bash_completion.d/ ]; then
    source /etc/bash_completion.d/*
fi

# bash_stuff - my bash files
if [ -d ~/.bash_stuff/ ]; then
    source ~/.bash_stuff/bash_aliases
    source ~/.bash_stuff/bash_binds
    source ~/.bash_stuff/bash_colors
    source ~/.bash_stuff/bash_completion
    source ~/.bash_stuff/bash_exports
    source ~/.bash_stuff/bash_functions
fi

# ssh, ftp, etc, - my file
if [ -f ~/.bash_stuff/bash_sfs ]; then
    source ~/.bash_stuff/bash_sfs
fi

# bash_prompt - my prompt ie: PS1
## moved to end

# inputrc - my inputrc
if [ -f ~/.inputrc ]; then
    source ~/.inputrc
fi

# colors - my dir_colors
if [ -f ~/.dir_colors ]; then
    eval `dircolors -b ~/.dir_colors`
fi

# dmenu - my demnu
if [ -f ~/.dmenurc ]; then
    source ~/.dmenurc
else
    DMENU="dmenu"
fi

# exit if we're in a script
[ -z "$PS1" ] && return

#if [ ! -z "$TERMCAP" ] && [ "$TERM" == "screen" ]; then
#    export TERMCAP=$(echo $TERMCAP | sed -e 's/Co#8/Co#256/g')
#fi

if [ -f ${HOME}/.termcap ]; then
    TERMCAP=$(< ${HOME}/.termcap)
    export TERMCAP
fi

function sshlog () { \ssh $@ 2>&1 | tee -a ~/.ssh/.logs/$(date +%Y%m%d).log; }
alias ssh="sshlog"

# sudo
alias visudo="sudo bash -c 'umask 0227;F=/etc/sudoers;T=\$F.tmp;cp -vPf \$F \$T;vim -u /dev/null --noplugins -mpX -c '\''exe \"set nu noswf nobk noaw write ft=sudoers\"|syn on|colorscheme desert'\'' \$T; visudo -cs -f \$T && mv -vf \$T \$F'"
export SUDO_EDITOR="/usr/bin/vim -p -X"
alias sudo="sudo -E"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ssh="TERM=linux ssh"

# grep color
##################
export GREP_COLOR="1;33"
alias grep='grep --color=auto'

##################################################
# Fancy PWD display function
##################################################
# The home directory (HOME) is replaced with a ~
# The last pwdmaxlen characters of the PWD are displayed
# Leading partial directory names are striped off
# /home/me/stuff          -> ~/stuff               if USER=me
# /usr/share/big_dir_name -> ../share/big_dir_name if pwdmaxlen=20
##################################################
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
if [ -f ~/.bash_stuff/bash_prompt ]; then
    source ~/.bash_stuff/bash_prompt
else
    source ~/.git-prompt.sh
    PS1="${R}[${LG}\\u${R}@${LG}\h ${TQ}\\W${R}] \n ${TR}\\$ "
fi

}

# DO NOT REMOVE #
PROMPT_COMMAND=bash_prompt_command
bash_prompt
unset bash_prompt
