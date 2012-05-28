#!/bin/bash
# . ~/.bashrc

export DISPLAY=:0.0

# ssh-gent
#eval $(ssh-agent)

# exit if we're in a script
[ -z "$PS1" ] && return

#if [ ! -z "$TERMCAP" ] && [ "$TERM" == "screen" ]; then
#    export TERMCAP=$(echo $TERMCAP | sed -e 's/Co#8/Co#256/g')
#fi

if [ -f ${HOME}/.termcap ]; then
    TERMCAP=$(< ${HOME}/.termcap)
    export TERMCAP
fi

# Bash shell driver for go (http://code.google.com/p/go-tool/).
function go {
    export GO_SHELL_SCRIPT=$HOME/.__tmp_go.sh
    python2 -m go $*
    if [ -f $GO_SHELL_SCRIPT ] ; then
        source $GO_SHELL_SCRIPT
    fi
    unset GO_SHELL_SCRIPT
}

# sudo
alias visudo="sudo bash -c 'umask 0227;F=/etc/sudoers;T=\$F.tmp;cp -vPf \$F \$T;vim -u /dev/null --noplugins -mpX -c '\''exe \"set nu noswf nobk noaw write ft=sudoers\"|syn on|colorscheme desert'\'' \$T; visudo -cs -f \$T && mv -vf \$T \$F'"
export SUDO_EDITOR="/usr/bin/vim -p -X"
alias sudo="sudo -E"

###
# Bash Suff
# ~/.bash_suff
# Bash Binds
[ -f ~/.bash_stuff/bash_binds ] && source ~/.bash_stuff/bash_binds
# Bash Aliases
[ -f ~/.bash_stuff/bash_aliases ] && source ~/.bash_stuff/bash_aliases
# Bash Passwords
[ -f ~/.bash_stuff/bash_passwd ] && source ~/.bash_stuff/bash_passwd
# Bash Complete
[ -f ~/.bash_stuff/bash_completion ] && source ~/.bash_stuff/bash_completion
# Inputrc file - Faster Completion
[ -f ~/.inputrc ] && source ~/.inputrc
#bash functions
[ -f ~/.bash_stuff/bash_functions ] && source ~/.bash_stuff/bash_functions
#bash_exports
[ -f ~/.bash_stuff/bash_exports ] && source ~/.bash_stuff/bash_exports
#bash completion
[ -f /etc/bash_completion ] && source /etc/bash_completion
## Bash Colors�
[ -f ~/.bash_stuff/bash_colors ] && source ~/.bash_stuff/bash_colors
# bash_login
#[ -f ~/.bash_login ] && source ~/.bash_login
#dir_colors
#eval `dircolors /etc/DIR_COLORS`
#eval `dircolors ~/.dir_colors`

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ssh="TERM=linux ssh"

# grep color
##################
export GREP_COLOR="1;33"
alias grep='grep --color=auto'

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

# export PS1="${P}[${C}\u${LP}@${TQ}\h${P}] ${R}+${W}-${R}+ ${P}[${LG}\${NEW_PWD}${P}] ${W}-${R}+ \n ${R}+${W}- ${LR}:${TQ}<${TR} ${TQ}\[\033[s\]\[\033[1;\$((COLUMNS-18))f\]\$(date +'%R:%S %m/%d/%Y')\[\033[u\]"
#PROMPT_COMMAND='history -a;echo -en "${Y}"$(( `sed -nu "s/MemFree:[\t ]\+\([0-9]\+\) kB/\1/p" /proc/meminfo`/1024))"${W}/${O}"$((`sed -nu "s/MemTotal:[\t ]\+\([0-9]\+\) kB/\1/Ip" /proc/meminfo`/1024 ))MB"\t${LP}$(< /proc/loadavg)"'
#PS1='\[\e[m\n\e[1;30m\][$$:$PPID \j:\!\[\e[1;30m\]]\[\e[0;36m\] \T \d \[\e[1;30m\][\[\e[1;34m\]\u@\H\[\e[1;30m\]:\[\e[0;37m\]${SSH_TTY} \[\e[0;32m\]+${SHLVL}\[\e[1;30m\]] \[\e[1;37m\]\w\[\e[0;37m\] \n[$SHLVL:\!]~> '
#export PS1="${P}[${C}\u${LP}@${TQ}\h${P}] ${R}+${W}-${R}+ ${P}[${LG}\${NEW_PWD}${P}] ${W}-${R}+ \n ${R}+${W}- ${LR}:${TQ}<${TR} ${TQ}\[\033[s\]\[\033[1;\$((COLUMNS-18))f\]\$(date +'%R:%S %m/%d/%Y')\[\033[u\]"
export PS1="${P}[${C}\u${LP}@${TQ}\h${P}] ${R}+${W}-${R}+ ${P}[${LG}\${NEW_PWD}${P}] ${W}-${R}+ \n ${R}+${W}- ${LR}:${TQ}<${TR} "
export PS2="  \[${Y}\]> \[${Y}\]"

}

# auto startx and logout, security ! 
#if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/vc/1 ]]; then
#  startx
#  logout
#fi

PROMPT_COMMAND=bash_prompt_command
bash_prompt
unset bash_prompt
