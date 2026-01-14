export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.local/share/bob/nightly/bin/:$HOME/.local/share/nvim/mason/:$PATH"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
alias nv="nvim ."
alias cds='dir="$(find . -type d | fzf)"; cd $dir'
alias nvs='dir="$(find . -type f | fzf)"; nvim $dir'
alias hs=" history | fzf "
alias gs="git status"
alias gpush="git push -u origin main"
alias cl="clear"
alias up="cd .."
alias pacin="sudo pacman -S $1"
alias newPico="cd $HOME/projects/learningCpp/pico/ && ./.newPicoProject.sh $1"
alias WIPE="echo 'are you sure you want to remove' $1 && rm -rf $1"
plugins=(git)
source $ZSH/oh-my-zsh.sh
source $HOME/.bobrc.sh


