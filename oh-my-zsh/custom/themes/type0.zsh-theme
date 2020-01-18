# ZSH Theme - type0
# Author: Mike Redd <mikeredd@protonmail.com>
# this zsh theme requires 256 color enabled terminal
# Preview - 
# based on classyTouch by yarisgutierrez.
#

local hostname='%{$fg_bold[white]%}[%{$reset_color%}%F{039}%m%{$reset_color%}'
local current_dir='%{$reset_color%}%F{108}%~% %{$fg_bold[white]%}]%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'


PROMPT="%(?,%{$fg_bold[red]%}┌─╼${hostname} ${current_dir}%{$reset_color%} ${git_branch}
%{$fg_bold[red]%}└─╼%{$reset_color%} ,%{$fg_bold[red]%}┌─╼${hostname} ${current_dir}%{$reset_color%} ${git_branch}
%{$fg_bold[red]%}└╼ %{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[white]%}[%F{100}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[white]%}] %{$reset_color%}"

