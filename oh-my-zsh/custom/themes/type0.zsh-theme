# ZSH Theme - type0
# Author: Mike Redd <mikeredd@protonmail.com>
# this zsh theme requires 256 color enabled terminal
# Preview - 
# based on classyTouch by yarisgutierrez.
#

local hostname='%B%F{208}[%{$reset_color%}%F{039}%m%{$reset_color%}'
local current_dir='%{$reset_color%}%F{108}%1~% %B%F{208}]%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'

if [ -n "$SSH_CLIENT" ]; then
     PROMPT="%(?,%F{208}┌─%B%F{208}<%{$reset_color%}%F{100}SSH%B%F{208}>%{$reset_color%}${hostname} ${current_dir}%{$reset_color%} ${git_branch}
%F{208}└╼%{$reset_color%} ,%F{208}┌─${hostname} ${current_dir}%{$reset_color%} ${git_branch}
%F{208}└╼ %{$reset_color%} "
else
     PROMPT="%(?,%F{208}┌─${hostname} ${current_dir}%{$reset_color%} ${git_branch}
%F{208}└╼%{$reset_color%} ,%F{208}┌─${hostname} ${current_dir}%{$reset_color%} ${git_branch}
%F{208}└╼ %{$reset_color%} "
fi

ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{208}[%{$reset_color%}%F{157}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%B%F{208}] %{$reset_color%}"
