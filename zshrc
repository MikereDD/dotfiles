# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/typezero/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="classyTouch"
ZSH_THEME="type0"
#ZSH_THEME="Imp"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
ZSH_CUSTOM=/home/typezero/.oh-my-zsh/custom/themes

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(archlinux autoenv autojump bundler colored-man colorize command-not-found compleat copydir copyfile cp extract gem git git-extras git-remote-branch gitfast github gnu-utils go gpg-agent history history-substring-search last-working-dir mercurial per-directory-history perl profiles python rsync ruby safe-paste screen ssh-agent svn systemd themes tmux torrent urltools vi-mode vundle)
#plugins=(archlinux autojump bundler colored-man colorize copydir copyfile cp extract git git-extras git-remote-branch github gnu-utils go gpg-agent history mercurial python rsync ruby safe-paste screen ssh-agent svn systemd themes tmux urltools vundle)
#plugins=(archlinux autojump colored-man colorize copydir copyfile cp extract git git-extras git-remote-branch github gnu-utils go gpg-agent history mercurial python rsync ruby safe-paste screen ssh-agent svn systemd themes tmux urltools vundle)
plugins=(archlinux colorize git git-extras git-remote-branch github themes tmux)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Aliases
alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# If not running interactively, don't do anything
#[ -z "$PS1" ] && return

# Source my ps prompt and git prompt
#if [ -f ~/.zsh_stuff/zsh_prompt ]; then
#  . ~/.zsh_stuff/zsh_prompt
#else
#  source ~/.git-prompt.sh
#  PS1="[\u@\h \W] \n \$ "
#fi

# Source command not found zsh
[[ -f /usr/share/doc/pkgfile/command-not-found.zsh ]] && . /usr/share/doc/pkgfile/command-not-found.zsh

# Source my zsh aliases
#if [ -d ~/.zsh_stuff/files/ ]; then
#  for f in ~/.zsh_stuff/files/*; do
#      . $f
#  done
#fi

# Source my ssh, ftp, etc files
#[[ -f ~/.zsh_stuff/zsh_sfs ]] && . ~/.zsh_stuff/zsh_sfs

# Source my inputrc file
#[[ -f ~/.inputrc ]] && . ~/.inputrc

# Source my dir_colors file
#[[ -f ~/.dir_colors ]] && eval `dircolors -b ~/.dir_colors`

# Source my demnurc file
#if [ -f ~/.dmenurc ]; then
#  source ~/.dmenurc
#else
#  DMENU="dmenu"
#fi

# GPG Key
#export GPGKEY=""

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s $BASE16_SHELL/profile_helper.sh ] && \
        eval "$($BASE16_SHELL/profile_helper.sh)"
