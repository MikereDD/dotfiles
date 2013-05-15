# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="trapd00r"

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(archlinux autoenv autojump bundler colored-man colorize command-not-found compleat copydir copyfile cp extract gem git git-extras git-remote-branch gitfast github gnu-utils go gpg-agent history history-substring-search last-working-dir mercurial per-directory-history perl profiles python rsync ruby safe-paste screen ssh-agent svn systemd themes tmux torrent urltools vi-mode vundle)
plugins=(archlinux autojump bundler colored-man colorize copydir copyfile cp extract git git-extras git-remote-branch github gnu-utils go gpg-agent history mercurial python rsync ruby safe-paste screen ssh-agent svn systemd themes tmux urltools vundle)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/opt/android-ndk:/opt/android-sdk/platform-tools:/opt/android-sdk/tools:/opt/java6/bin:/opt/java6/db/bin:/opt/java6/jre/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/opt/plan9/bin:/home/typezero/bin:/home/typezero/Scripts:/home/typezero/.gem/ruby/2.0.0/bin:/usr/lib/surfraw
#ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
#ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
#ZSH_THEME_GIT_PROMPT_CLEAN=""

# GPG Key
export GPGKEY=

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

## source files
# PS Prompt
#if [ -f ~/.zsh_stuff/zsh_prompt ]; then
#    . ~/.zsh_stuff/zsh_prompt
#else
#    source ~/.git-prompt.sh
#    PS1="[\u@\h \W] \n \$ "
#fi

# Aliases files from ~/.zsh_stuff
[[ -f /usr/share/doc/pkgfile/command-not-found.zsh ]] && . /usr/share/doc/pkgfile/command-not-found.zsh
# zsh_stuff - my zsh files
[[ -f ~/.zsh_stuff/zsh_aliases ]] && . ~/.zsh_stuff/zsh_aliases
#[[ -f ~/.zsh_stuff/zsh_binds ]] && . ~/.zsh_stuff/zsh_binds
#[[ -f ~/.zsh_stuff/zsh_colors ]] && . ~/.zsh_stuff/zsh_colors
#[[ -f ~/.zsh_stuff/zsh_completion ]] && . ~/.zsh_stuff/zsh_completion
#[[ -f ~/.zsh_stuff/zsh_exports ]] && . ~/.zsh_stuff/zsh_completion
#[[ -f ~/.zsh_stuff/zsh_exports ]] && . ~/.zsh_stuff/zsh_exports
#[[ -f ~/.zsh_stuff/zsh_functions ]] && . ~/.zsh_stuff/zsh_functions
#
# ssh, ftp, etc, - my file
[[ -f ~/.zsh_stuff/zsh_sfs ]] && . ~/.zsh_stuff/zsh_sfs
# inputrc - my inputrc
[[ -f ~/.inputrc ]] && . ~/.inputrc
# colors - my dir_colors
[[ -f ~/.dir_colors ]] && eval `dircolors -b ~/.dir_colors`
# dmenu - my demnu
if [ -f ~/.dmenurc ]; then
    source ~/.dmenurc
else
    DMENU="dmenu"
fi

