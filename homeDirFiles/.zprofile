#
# ~/.bash_profile
#
#
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec start-hyprland
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc


. "/home/theo/.local/share/bob/env/env.sh"
