export ZSH=$HOME/.oh-my-zsh

DISABLE_UPDATE_PROMPT=true

ZSH_THEME="zanshin/zanshin"
plugins=(git sudo zsh-syntax-highlighting zsh-autosuggestions zsh-completions autojump osx)

export SSH_AUTH_SOCK=~/.ssh/ssh-agent.$HOSTNAME.sock
ssh-add -l 2>/dev/null >/dev/null
if [ $? -ge 2 ]; then
  echo Starting ssh-agent...
  ssh-agent -a "$SSH_AUTH_SOCK" >/dev/null
fi

source $ZSH/oh-my-zsh.sh
source $HOME/dotfiles/aliases
source $HOME/.aliases


