#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.local/share/bob/nvim-bin/:$PATH

alias ls='ls --color=auto'
alias grep='grep --color=auto'
#PS1='[\u@\h \W]\$ '
#. "/home/theo/.local/share/bob/env/env.sh"
#. "/home/theo/.local/share/bob/env/env.sh"

exec zsh
