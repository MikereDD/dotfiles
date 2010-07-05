#!/bin/bash
# ~/.bashrc
# http://m-redd.com
# tueGroup
# Smaller than Life Projects
# By: MreDD     mredd (at) 0tue0.com
##################
##copy progress bar
copy() { # src dst [width]
    srcsize=$(stat -c %s $1) || return $?
    dstsize=0
    width=${3:-25}
    mega=$(( 1024 * 1024 ))
    start=$(date +%s)
    cat $1 | (
    while [[ dstsize -lt srcsize ]]
    do
        dd bs=512 count=2048 2>/dev/null || return $?
        (( dstsize += $mega ))
        [[ dstsize -gt srcsize ]] && dstsize=$srcsize

        # print truncated filename
        name=$(basename $1 | cut -b -20)
        printf "\r%-20s " $name 1>&2

        # print percentage
        percent=$(( 100 * $dstsize / $srcsize ))
        printf "%3d%% [" $percent 1>&2

        # print progress bar
        bar=$(( $width * $dstsize / $srcsize ))
        for i in $(seq 1 $bar); do printf "=" 1>&2; done
        for i in $(seq $bar $(( $width-1 ))); do printf " " 1>&2; done

        # print size of file copied
        if [[ $dstsize -le 1024 ]]; then
            printf -v size "%d" $dstsize;
        elif [[ $dstsize -le $mega ]]; then
            printf -v size "%d kB" $(( $dstsize / 1024  ));
        else
            printf -v size "%d MB" $(( $dstsize / $mega ));
        fi
        printf "] %7s" "$size" 1>&2

        # print estimated time of arrival
        elapsed=$(( $(date +%s) - $start ))
        remain=$(( $srcsize - $dstsize ))
        eta=$(( ($elapsed * $remain) / $dstsize + 1))
        if [[ $remain == 0 ]]; then eta=0; fi
        etamin=$(( $eta / 60 ))
        etasec=$(( $eta % 60 ))
        if [[ $eta > 0 ]]; then etastr="ETA"; else etastr="   "; fi
        printf "   %02d:%02d $etastr" $etamin $etasec 1>&2
    done
    echo 1>&2
    ) | cat >$2
}
#ssh
#eval `ssh-agent`
#/usr/bin/keychain -Q -q --nogui ~/.ssh/id_dsa
#[[ -f $HOME/.keychain/$HOSTNAME-sh ]] && source $HOME/.keychain/$HOSTNAME-sh
# GIT STATUS MAGIC (START)
GIT_PS1_SHOWDIRTYSTATE=true
function parse_git_branch {
 
  git rev-parse --git-dir &> /dev/null
  git_status="$(git status 2> /dev/null)"
  branch_pattern="^# On branch ([^${IFS}]*)"
  remote_pattern="# Your branch is (.*) of"
  diverge_pattern="# Your branch and (.*) have diverged"
  if [[ ! ${git_status}} =~ "working directory clean" ]]; then
state="${COLOR_RED}⚡"
  fi
  # add an else if or two here if you want to get more specific
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
remote="${COLOR_YELLOW}↑"
    else
remote="${COLOR_YELLOW}↓"
    fi
fi
if [[ ${git_status} =~ ${diverge_pattern} ]]; then
remote="${COLOR_YELLOW}↕"
  fi
if [[ ${git_status} =~ ${branch_pattern} ]]; then
branch=${BASH_REMATCH[1]}
    echo -e "${COLOR_LIGHT_GREEN}➔(${branch})${remote}${state}"
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
UC=$W                 # user's color

[ $UID -eq "0" ] && UC=$R   # root's color

# Dir_Colors
##################
if type -P dircolors >/dev/null ; then
if [[ -f ~/.dir_colors ]] ; then
eval $(dircolors -b ~/.dir_colors)
elif [[ -f /etc/DIR_COLORS ]] ; then
eval $(dircolors -b /etc/DIR_COLORS)
fi
fi

#
set show-all-if-ambiguous on

if [ "$TERM" = "Linux" ]; then
  PROMPT_COMMAND='dirs | wmiir write /client/sel/label'
fi

if [ "$COLORTERM" == "rxvt" ]; then
    export TERM=rxvt-256color
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

# Bash shell driver for 'go' (http://code.google.com/p/go-tool/).
function go {
    export GO_SHELL_SCRIPT=$HOME/.__tmp_go.sh
    python -m go $*
    if [ -f $GO_SHELL_SCRIPT ] ; then
        source $GO_SHELL_SCRIPT
    fi
    unset GO_SHELL_SCRIPT
}

#screenwm
#eval screen "exec screenwm init"

#
PROMPT_COMMAND=bash_prompt_command
#bash_prompt
#unset bash_prompt

#bash completion
complete -cf sudo
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Bash Aliases
##################
if [ -f ~/.bash_aliases ]; then
 . ~/.bash_aliases
fi

# grep color
##################
export GREP_COLOR="1;33"
alias grep='grep --color=auto'

# Dynamic resizing
##################
shopt -s checkwinsize

#export LESS_TERMCAP_mb=$'\E[01;31m'
#export LESS_TERMCAP_md=$'\E[01;31m'
#export LESS_TERMCAP_me=$'\E[0m'
#export LESS_TERMCAP_se=$'\E[0m'                           
#export LESS_TERMCAP_so=$'\E[01;44;33m'                                 
#export LESS_TERMCAP_ue=$'\E[0m'
#export LESS_TERMCAP_us=$'\E[01;32m'
#

#
export EDITOR="vim"
export BROWSER="elinks"
#export PAGER="$HOME/apps/bin/vimpager"

# WELCOME SCREEN
####################
clear
echo "";
#sysinfo
uptime
echo ""
fortune
echo "";

PS1="${DG}[${LG}\u${R}@${TQ}\h${DG}]${W}──${DG}[${DG}\$(tty | sed -e 's:/dev/::'):${GL}\$(ls -1 | wc -l | sed 's: ::g') ${DG}files${LG}:${GL}\$(ls -lah | grep -m 1 total | sed 's/total //')b${DG}] \n ${W}┌─${DG}[${LP}\${NEW_PWD}${DG}] \n ${LG}└─${R}:${DG}(${LG} "

#EOF
##################
