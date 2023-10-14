export ZSH=$HOME/.oh-my-zsh

DISABLE_UPDATE_PROMPT=true

ZSH_THEME="zanshin/zanshin"
plugins=(git sudo autojump macos)

# set keychain host to avoid new agent when vpn changes hostname
eval `keychain --eval --agents ssh --host macbook14`

source $ZSH/oh-my-zsh.sh
source $HOME/dotfiles/aliases
source $HOME/.aliases


