export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.local/share/bob/nightly/bin/:$HOME/.local/share/nvim/mason/:$PATH"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="sonicradish"
alias nv="nvim ."
alias qtest='g++ test.cpp -o test && ./test; rm test'
alias pr='cd $( find $HOME/projects/ -type d | fzf --height 30% --layout reverse)'
alias cds='cd $( find . -type d | fzf --height 30% --layout reverse)'
alias igd='echo "-path \"./$(basename $PWD)\" -prune -o" >> $HOME/.config/homeDirFiles/localIgnore.txt'
alias cfg='cd $( find $HOME/.config/ -type d | fzf --height 30% --layout reverse)'
alias gpush="git push -u origin main"
alias cl="clear"
alias up="cd .."
alias pacin="sudo pacman -S $1"
alias newPico="cd $HOME/projects/learningCpp/pico/ && ./.newPicoProject.sh $1"
alias WIPE="echo 'are you sure you want to remove' $1 && rm -rf $1"
plugins=(git)
source $ZSH/oh-my-zsh.sh
#source $HOME/.config/fzf-tab-completion/zsh/fzf-zsh-completion.sh
#bindkey '^I' fzf_completion

eval "$(zoxide init zsh)"
source $HOME/.bobrc.sh


