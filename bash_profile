#
# ~/.bash_profile
#

# Keychain lines to help ssh-agent
eval `keychain --eval --agents ssh id_ecdsa id_rsa id_dsa id_xzibition_rsa`

# source keychains
source ~/.keychain/${HOSTNAME}-sh > /dev/null

# Run GPG-Agent
#eval $(gpg-agent --daemon)

# Bash shell driver for 'go' (http://code.google.com/p/go-tool/).
function go {
    export GO_SHELL_SCRIPT=$HOME/.__tmp_go.sh
    python2 -m go $*
    if [ -f $GO_SHELL_SCRIPT ] ; then
        source $GO_SHELL_SCRIPT
    fi
    unset GO_SHELL_SCRIPT
}

# Editor
export EDITOR="vim"
# Browser
#export BROWSER="elinks"
#export BROWSER="/usr/bin/vimprobable2-tabbed"
#export BROWSER="dwb"
if [ -n "$DISPLAY" ]; then
    BROWSER=vimperator
else
    BROWSER=elinks
fi
# Proxy
ftp_proxy="ftp://192.168.11.1:21"
http_proxy="http://192.168.11.1:80"
#
# Pager
export PAGER="vimpager"
# History
#export HISTCONTROL="ignoredups"
#export HISTCONTROL="ignorespace"
export HISTCONTROL="ignoreboth"
# CDARGS Custom BASH
#source /usr/share/cdargs/cdargs-bash.sh
# SDL Audio
export SDL_AUDIODRIVER="alsa"
# ALSA Audio
export AUDIODEV="plug:dmix"
# Display
export DISPLAY=:0.0

# Screen hack
export SDL_VIDEO_FULLSCREEN_HEAD=1
#
#export LC_ALL=
#export LC_COLLATE="C"
#export LANG="UTF-8"

# Path's Binary
# PATH=$PATH:/data/myscripts
# export PATH
PATH="/usr/local/bin:/usr/local/games:optional/bin:$PATH:$HOME/apps/bin"
export PATH

#sourcing ~/.bashrc is a good thing
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

## Start X
if [[ -z $DISPLAY && $(tty) = /dev/tty1 ]]; then
#    exec startx
    exec xinit -- /usr/bin/X -nolisten tcp vt7
fi

## Start X with TTY1 checking
#if [[ -z $DISPLAY && ! -e /tmp/.X11-unix/X0 ]] && (( EUID )); then
#  exec startx
#fi

## Start X with Prompt to User
#if [[ -z $DISPLAY && ! -e /tmp/.X11-unix/X0 ]] && (( EUID )); then
#  while true; do
#    read -p 'Do you want to start X? (y/n): '
#    case $REPLY in
#      [Yy]) exec xinit -- /usr/bin/X -nolisten tcp vt7 ;;
#      [Nn]) break ;;
#      *) printf '%s\n' 'Please answer y or n.' ;;
#    esac
#  done
#fi

