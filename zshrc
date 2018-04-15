export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="zanshin/zanshin"
plugins=(git sudo zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
source $HOME/dotfiles/aliases
source $HOME/.aliases

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

export PATH="$PATH:$HOME/.rvm/bin"

eval `ssh-agent -s`
#echo ssh-add ~/.ssh/id_github >> ~/.zshrc
