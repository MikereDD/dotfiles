#
# ~/.bash_profile
#

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

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
