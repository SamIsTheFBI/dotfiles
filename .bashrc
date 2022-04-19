#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export PATH="~/.local/bin:$PATH"
exec zsh
export YT_API_KEY=AIzaSyC4e2yZ3YI5NFNCT7HVcsPJ6ErcDXWkbbQ
