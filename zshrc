export ZSH=$HOME/.oh-my-zsh

DISABLE_UPDATE_PROMPT=true

ZSH_THEME="zanshin/zanshin"
plugins=(git sudo zsh-syntax-highlighting zsh-autosuggestions autojump osx ssh-agent)

source $ZSH/oh-my-zsh.sh
source $HOME/dotfiles/aliases
source $HOME/.aliases


