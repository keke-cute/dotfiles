# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias xis='sudo xbps-install -S' 
PS1='[\u@\h \W]\$ '
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec startx
fi
[ -x /bin/fish ] && SHELL=/bin/fish exec /bin/fish
