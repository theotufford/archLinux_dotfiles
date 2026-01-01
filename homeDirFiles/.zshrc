export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.local/share/bob/nightly/bin/:$HOME/.local/share/nvim/mason/:$PATH"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
alias nv="nvim ."
alias cl="clear"
alias up="cd .."
alias pacin="sudo pacman -S $1"
alias newPico="cd $HOME/projects/learningCpp/pico/ && ./.newPicoProject.sh $1"
alias WIPE="rm -rf $1"
plugins=(git)
source $ZSH/oh-my-zsh.sh
source $HOME/.bobrc.sh


