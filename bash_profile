#
# ~/.bash_profile
#

# Keychain lines to help ssh-agent
eval `keychain --eval --agents ssh id_ecdsa id_rsa id_dsa`

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

#sourcing ~/.bashrc is a good thing
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

if [[ -z $DISPLAY && $(tty) = /dev/tty1 ]]; then
  exec startx
  # Could use xinit instead of startx
  #exec xinit -- /usr/bin/X -nolisten tcp vt7
fi


