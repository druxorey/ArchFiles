#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='exa'
alias ll='exa -alh'
alias cat='bat'
alias tree='exa --tree'
alias grep='grep --color=auto'

PS1='[\u@\h \W]\$ '

eval "$(thefuck --alias)"