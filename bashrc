#!/bin/bash
# . ~/.bashrc

###
# Bash Suff
# ~/.bash_suff
##

# Bash Binds
if [ -f ~/.bash_stuff/bash_binds ]; then
    . ~/.bash_stuff/bash_binds
fi
# Bash Aliases
##################
if [ -f ~/.bash_stuff/bash_aliases ]; then
    . ~/.bash_stuff/bash_aliases
fi
# Bash Passwords
if [ -f ~/.bash_stuff/bash_passwd ]; then
    . ~/.bash_stuff/bash_passwd
fi
# Bash Complete
##################
if [ -f ~/.bash_stuff/bash_complete ]; then
    . ~/.bash_stuff/bash_complete
fi
# Inputrc file - Faster Completion
if [ -f ~/.inputrc ]; then
    . ~/.inputrc
fi

#bash completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Term
#if [ -e /usr/share/terminfo/r/rxvt-unicode-256color ]; then
#    export TERM='rxvt-unicode-256color'
#elif [ -e /usr/share/terminfo/r/rxvt-unicode ]; then
#    export TERM='rxvt-unicode'
#elif [ -e /usr/share/terminfo/r/rxvt-256color ]; then
#    export TERM='rxvt-256color'
#elif [ -e /usr/share/terminfo/r/rxvt-color ]; then
#    export TERM='rxvt-color'
#elif [ -e /usr/share/terminfo/r/rxvt ]; then
#    export TERM='rxvt'
#elif [ -e /usr/share/terminfo/x/xterm-256color ]; then
#    export TERM='xterm-256color'
#elif [ -e /usr/share/terminfo/x/xterm-color ]; then
#    export TERM='xterm-color'
#elif [ -e /usr/share/terminfo/x/xterm ]; then
#    export TERM='xterm'
#else
#    TERM='xterm'
#fi
TERM='rxvt'

alias ssh="TERM=linux ssh"

complete -cf sudo
complete -cf man

# grep color
##################
export GREP_COLOR="1;33"
alias grep='grep --color=auto'

# Dynamic resizing
##################
shopt -s checkwinsize

# GIT STATUS MAGIC (START)
GIT_PS1_SHOWDIRTYSTATE=true
function parse_git_branch {
 
  git rev-parse --git-dir &> /dev/null
  git_status="$(git status 2> /dev/null)"
  branch_pattern="^# On branch ([^${IFS}]*)"
  remote_pattern="# Your branch is (.*) of"
  diverge_pattern="# Your branch and (.*) have diverged"
  if [[ ! ${git_status}} =~ "working directory clean" ]]; then
state="${R}\u26a1"
  fi
  # add an else if or two here if you want to get more specific
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
remote="${Y}\u2191"
    else
remote="${Y}\u2193"
    fi
fi
if [[ ${git_status} =~ ${diverge_pattern} ]]; then
remote="${Y}\u2195"
  fi
if [[ ${git_status} =~ ${branch_pattern} ]]; then
branch=${BASH_REMATCH[1]}
    echo -e "${LG}\u2794(${branch})${remote}${state}"
  fi
}

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

## Bash Colors
if [ -f ~/.bash_stuff/bash_colors ]; then
    . ~/.bash_stuff/bash_colors
fi

#    # regular colors
#    local K="\[\033[0;30m\]"    # black
#    local R="\[\033[0;31m\]"    # red
#    local G="\[\033[0;32m\]"    # green
#    local Y="\[\033[0;33m\]"    # yellow
#    local B="\[\033[0;34m\]"    # blue
#    local M="\[\033[0;35m\]"    # magenta
#    local C="\[\033[0;36m\]"    # cyan
#    local W="\[\033[0;37m\]"    # white
#    local O="\[\e[0;33m\]"    # orange
#    local P="\[\e[0;35m\]"    # purple
#    local LG="\[\e[0;37m\]"   # lightgray
#    local DG="\[\e[0;90m\]"   # darkgray
#    local GL="\[\e[0;92m\]"   # lightgreen
#    local LR="\[\e[0;91m\]"   # lightred
#    local LP="\[\e[0;95m\]"   # lightpurple
#    local TQ="\[\e[0;96m\]"   # tourquoise
#    # emphasized (bolded) colors
#    local EMK="\[\033[1;30m\]"
#    local EMR="\[\033[1;31m\]"
#    local EMG="\[\033[1;32m\]"
#    local EMY="\[\033[1;33m\]"
#    local EMB="\[\033[1;34m\]"
#    local EMM="\[\033[1;35m\]"
#    local EMC="\[\033[1;36m\]"
#    local EMW="\[\033[1;37m\]"
#    local EMO="\[\e[1;43m\]"  # orange
#    local EMP="\[\e[1;105m\]"  # purple
#    # background colors
#    local BGK="\[\033[40m\]"
#    local BGR="\[\033[41m\]"
#    local BGG="\[\033[42m\]"
#    local BGY="\[\033[43m\]"
#    local BGB="\[\033[44m\]"
#    local BGM="\[\033[45m\]"
#    local BGC="\[\033[46m\]"
#    local BGW="\[\033[47m\]"
#    local BGO="\[\e[1;43m\]"  # Orange
#    local BGP="\[\e[1;45m\]"  # Purple
    local UC=$W                 # user's color
    [ $UID -eq "0" ] && UC=$R   # root's color

#    PS1="$TITLEBAR ${EMK}[${UC}\u${EMK}@${UC}\h ${EMB}\${NEW_PWD}${EMK}]${UC}\\$ ${NONE}"
#    PS1="${P}[${TQ}\u${LP}@${LR}\h${P}] ${R}+${W}-${R}+ ${P}[${TQ}\$(tty | sed -e 's:/dev/::')${R}:${LG}\$(ls -1 | wc -l | sed 's: ::g') ${TQ}files${R}:${LG}\$(ls -lah | grep -m 1 total | sed 's/total //')b${P}] \n ${R}+${W}- ${P}[${LG}\${NEW_PWD}${P}] ${W}-${R}+ \n ${R}+${W}- ${LR}:${TQ}<${TR} "
    PS1="${P}[${C}\u${LP}@${TQ}\h${P}] ${R}+${W}-${R}+ ${P}[${LG}\${NEW_PWD}${P}] ${W}-${R}+ \n ${R}+${W}- ${LR}:${TQ}<${TR} "
#    PS1="\u@\h\[\e[33m\]\W\[\e[0m\] \[\`if [[ \$? = "0" ]]; then echo '\e[32m:)\e[0m'; else echo '\e[31m:(\e[0m' ; fi\`\] \$ "
#    PS1="${P}[${TQ}\u${LP}@${LR}\h${P}] ${R}+${W}-${R}+ ${P}[${LG}\${NEW_PWD}${P}] ${W}-${R}+ \n ${R}+${W}- \[\`if [[ \$? = "0" ]]; then echo '${W}:${TQ}<\e[0m'; else echo '${W}:${R}>\e[0m' ; fi\`\] \${LP}$\e[0m${LG} "
#    PS1="[\u@\h] [\$(tty | sed -e 's:/dev/::'):\$(ls -1 | wc -l | sed 's: ::g') files:\$(ls -lah | grep -m 1 total | sed 's/total //')b]  \n [\${NEW_PWD}] \n :< "
    # without colors: PS1="[\u@\h \${NEW_PWD}]\\$ "
    # extra backslash in front of \$ to make bash colorize the prompt
}

PROMPT_COMMAND=bash_prompt_command
bash_prompt
unset bash_prompt
