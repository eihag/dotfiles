export ZSH=$HOME/.oh-my-zsh

DISABLE_UPDATE_PROMPT=true

ZSH_THEME="zanshin/zanshin"
plugins=(git sudo zsh-syntax-highlighting zsh-autosuggestions autojump osx)

source $ZSH/oh-my-zsh.sh
source $HOME/dotfiles/aliases
source $HOME/.aliases

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

export PATH="$PATH:$HOME/.rvm/bin"

eval `ssh-agent -s`
# ssh-add ~/.ssh/id_github
