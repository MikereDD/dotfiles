#!/bin/bash
# ~/.bashrc
# http://m-redd.com
# tueGroup
# Smaller than Life Projects
# By: MreDD     mredd (at) 0tue0.com
##################

###
# Bash Suff
# ~/.bash_suff
## Bash Colors
if [ -f ~/.bash_stuff/bash_colors ]; then
    . ~/.bash_stuff/bash_colors
fi
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

# Inputrc file - Faster Completion
if [ -f ~/.inputrc ]; then
    . ~/.inputrc
fi

# Bash Logout
#if [ -f ~/.bash_logout ]; then
#    . ~/.bash_logout
#fi

#bash completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Term
if [ -e /usr/share/terminfo/r/rxvt-unicode-256color ]; then
    export TERM='rxvt-unicode-256color'
elif [ -e /usr/share/terminfo/r/rxvt-unicode ]; then
    export TERM='rxvt-unicode'
elif [ -e /usr/share/terminfo/r/rxvt-256color ]; then
    export TERM='rxvt-256color'
elif [ -e /usr/share/terminfo/r/rxvt-color ]; then
    export TERM='rxvt-color'
elif [ -e /usr/share/terminfo/r/rxvt ]; then
    export TERM='rxvt'
elif [ -e /usr/share/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
elif [ -e /usr/share/terminfo/x/xterm-color ]; then
    export TERM='xterm-color'
elif [ -e /usr/share/terminfo/x/xterm ]; then
    export TERM='xterm'
else
    TERM='xterm'
fi

alias ssh="TERM=linux ssh"

# Tweetdeck hack
alias tweetdeck='export GNOME_DESKTOP_SESSION_ID=1 && adobe-air /opt/tweetdeck/tweetdeck.air'
# Grooveshark hack
alias grooveshark-desktop='export GNOME_DESKTOP_SESSION_ID=1 && adobe-air /opt/grooveshark-desktop/grooveshark-desktop.air'

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

#
##################
# Fancy PWD display function
##################
# The home directory (HOME) is replaced with a ~
# The last pwdmaxlen characters of the PWD are displayed
# Leading partial directory names are striped off
# /home/me/stuff          -> ~/stuff               if USER=me
# /usr/share/big_dir_name -> ../share/big_dir_name if pwdmaxlen=20
##################
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
#screenwm
#eval screen "exec screenwm init"

#
PROMPT_COMMAND=bash_prompt_command
#PROMPT_COMMAND='RET=$?; if [[ $RET -eq 0 ]]; then echo -ne "\033[0;32m$RET\033[0m ;)"; else echo -ne "\033[0;31m$RET\033[0m ;("; fi; echo -n " "'
#bash_prompt
#unset bash_prompt

complete -cf sudo
complete -cf man

# grep color
##################
export GREP_COLOR="1;33"
alias grep='grep --color=auto'

# Dynamic resizing
##################
shopt -s checkwinsize

#PS1="${P}[${TQ}\u${LP}@${LR}\h${P}] ${R}+${W}-${R}+ ${P}[${TQ}\$(tty | sed -e 's:/dev/::')${R}:${LG}\$(ls -1 | wc -l | sed 's: ::g') ${TQ}files${R}:${LG}\$(ls -lah | grep -m 1 total | sed 's/total //')b${P}] \n ${R}+${W}- ${P}[${LG}\${NEW_PWD}${P}] ${W}-${R}+ \n ${R}+${W}- ${LR}:${TQ}<${LG}(${LG} "
#PS1=">\[\033[s\]\[\033[1;\$((COLUMNS-4))f\]\$(date +%H:%M)\[\033[u\]"
PS1="${P}[${TQ}\u${LP}@${LR}\h${P}] ${R}+${W}-${R}+ ${P}[${TQ}\$(tty | sed -e 's:/dev/::')${R}:${LG}\$(ls -1 | wc -l | sed 's: ::g') ${TQ}files${R}:${LG}\$(ls -lah | grep -m 1 total | sed 's/total //')b${P}] \n ${R}+${W}- ${P}[${LG}\${NEW_PWD}${P}] ${W}-${R}+ \n ${R}+${W}- ${LR}:${TQ}<${LG}(${LG} ${TQ}\[\033[s\]\[\033[1;\$((COLUMNS-4))f\]\$(date +%H:%M)\[\033[u\]"

#EOF
##################
