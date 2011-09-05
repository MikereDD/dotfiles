#!/bin/bash
# ~/.bashrc
# http://m-redd.com
# tueGroup
# Smaller than Life Projects
# By: MreDD     mredd (at) 0tue0.com
##################

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

#
export EDITOR="vim"
#export BROWSER="elinks"
#export BROWSER="/usr/bin/vimprobable2-tabbed"
#export BROWSER="dwb"
if [ -n "$DISPLAY" ]; then
    BROWSER=dwb
else
    BROWSER=elinks
fi
# Proxy
ftp_proxy="ftp://192.168.11.1:21"
http_proxy="http://192.168.11.1:80"
#
export PAGER="vimpager"
export PATH="$PATH:/home/mredd:/home/mredd/apps/bin"
#export HISTCONTROL="ignoredups"
#export HISTCONTROL="ignorespace"
export HISTCONTROL="ignoreboth"
#source /usr/share/cdargs/cdargs-bash.sh
export SDL_AUDIODRIVER="alsa"
export AUDIODEV="plug:dmix"

# Screen hack
export SDL_VIDEO_FULLSCREEN_HEAD=1
#
#export LC_ALL=
#export LC_COLLATE="C"
#export LANG="UTF-8"

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
state="${COLOR_RED}\u26a1"
  fi
  # add an else if or two here if you want to get more specific
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
remote="${COLOR_YELLOW}\u2191"
    else
remote="${COLOR_YELLOW}\u2193"
    fi
fi
if [[ ${git_status} =~ ${diverge_pattern} ]]; then
remote="${COLOR_YELLOW}\u2195"
  fi
if [[ ${git_status} =~ ${branch_pattern} ]]; then
branch=${BASH_REMATCH[1]}
    echo -e "${COLOR_LIGHT_GREEN}\u2794(${branch})${remote}${state}"
  fi
}

# color
#################
# Color Codes
####################
# 0   = default colour     40  = black background       94  = light blue
# 1   = bold               41  = red background         95  = light purple
# 4   = underlined         42  = green background       96  = turquoise
# 5   = flashing text      43  = orange background      100 = dark grey background
# 7   = reverse field      44  = blue background        101 = light red background
# 31  = red                45  = purple background      102 = light green background
# 32  = green              46  = cyan background        103 = yellow background
# 33  = orange             47  = grey background        104 = light blue background
# 34  = blue               90  = dark grey              105 = light purple background
# 35  = purple             91  = light red              106 = turquoise background
# 36  = cyan               92  = light green
# 37  = grey               93  = yellow
####################
 #local NONE="\[\033[0m\]"    # unsets color to term's fg color
    
# regular colors
K="\[\033[0;30m\]"    # black
R="\[\033[0;31m\]"    # red
G="\[\033[0;32m\]"    # green
Y="\[\033[0;33m\]"    # yellow
B="\[\033[0;34m\]"    # blue
M="\[\033[0;35m\]"    # magenta
C="\[\033[0;36m\]"    # cyan
W="\[\033[0;37m\]"    # white
O="\[\e[0;33m\]"    # orange
P="\[\e[0;35m\]"    # purple
LG="\[\e[0;37m\]"   # lightgray
DG="\[\e[0;90m\]"   # darkgray
GL="\[\e[0;92m\]"   # lightgreen
LR="\[\e[0;91m\]"   # lightred
LP="\[\e[0;95m\]"   # lightpurple
TQ="\[\e[0;96m\]"   # tourquoise

# emphasized (bolded) colors
EMK="\[\033[1;30m\]"  # black
EMR="\[\033[1;31m\]"  # red
EMG="\[\033[1;32m\]"  # green
EMY="\[\033[1;33m\]"  # yellow
EMB="\[\033[1;34m\]"  # blue
EMM="\[\033[1;35m\]"  # magenta
EMC="\[\033[1;36m\]"  # cyan
EMW="\[\033[1;37m\]"  # white
EMO="\[\e[1;43m\]"  # orange
EMP="\[\e[1;105m\]"  # purple

# background colors
BGK="\[\033[40m\]"  # black
BGR="\[\033[41m\]"  # red
BGG="\[\033[42m\]"  # green
BGY="\[\033[43m\]"  # yellow
BGB="\[\033[44m\]"  # blue
BGM="\[\033[45m\]"  # magenta
BGC="\[\033[46m\]"  # cyan
BGW="\[\033[47m\]"  # white
BGW="\[\e[1;43m\]"  # orange
BGW="\[\e[1;45m\]"  # purple
BGGR="\[\e[0;90m\]"
#UC=$W               # user's color
TR="\[\e[0m\]"      # Text Reset

[ $UID -eq "0" ] && UC=$R   # root's color

# Dir_Colors & LS++ LS_COLORS
##################
if type -P dircolors >/dev/null ; then
    if [[ -f $HOME/.LS_COLORS ]] ; then
        eval $( dircolors -b $HOME/.LS_COLORS )
    elif [[ -f $HOME/.dir_colors ]] ; then
        eval $( dircolors -b $HOME/.dir_colors )
    elif [[ -f /etc/DIR_COLORS ]] ; then
        eval $( dircolors -b /etc/DIR_COLORS )
    fi
fi

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
#bash_prompt
#unset bash_prompt

#bash completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
complete -cf sudo
complete -cf man


# Bash Aliases
##################
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Bash Binds
##################
if [ -f ~/.bash_binds ]; then
    . ~/.bash_binds
fi

# Inputrc file - Faster Completion
if [ -f ~/.inputrc ]; then
    . ~/.inputrc
fi

# Bash Logout
#if [ -f ~/.bash_logout ]; then
#    . ~/.bash_logout
#fi

# grep color
##################
export GREP_COLOR="1;33"
alias grep='grep --color=auto'

# Dynamic resizing
##################
shopt -s checkwinsize

PS1="${P}[${GL}\u${LP}@${TQ}\h${P}] ${R}+${W}-${R}+ ${P}[${Y}\$(tty | sed -e 's:/dev/::')${R}:${LG}\$(ls -1 | wc -l | sed 's: ::g') ${Y}files${R}:${LG}\$(ls -lah | grep -m 1 total | sed 's/total //')b${P}] \n ${R}+${W}- ${P}[${LG}\${NEW_PWD}${P}] ${W}-${R}+ \n ${R}+${W}- ${LR}:${TQ}(${LG} "

#EOF
##################
