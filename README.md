Setup development workstation
==========
These are my .dotfiles. There are many like them, but these ones are mine.

#OSX
Install HomeBrew + Zsh + Oh-my-Zsh and more
<pre><code>
xcode-select --install

cd ~
git clone https://github.com/eihag/dotfiles.git

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
ln -s dotfiles/Brewfile $HOME/.Brewfile
brew bundle --global

curl -sSL https://get.rvm.io | bash -s stable

git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://gist.github.com/1142716.git ~/.oh-my-zsh/custom/themes/zanshin

touch ~/.aliases
echo source $HOME/dotfiles/zshrc>~/.zshrc

brew cleanup
brew cask cleanup
</code></pre>



# Windows
Download here: https://cygwin.com/install.html
<pre><code>
setup-x86_64.exe --upgrade-also --packages curl,diffutils,git,git-svn,grep,gzip,ncurses,openssh,python,ruby,tar,vim,wget,zsh
ln -s $USERPROFILE/.ssh ~

git clone git://github.com/joelthelion/autojump.git ~/zsh-config/autojump
cd autojump
./install.py

# rememember to add the following to .zshrc:
#    [[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh 
</code></pre>
Tip: Clean windows path of unused PATH entries - speeds up cygwin considerably!

### Git
<pre><code>
# Setup RSA key for github
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_github
git config --global user.name "username"
git config --global user.email email@address.com
git config --global url.ssh://git@github.com/.insteadOf https://github.com/
</code></pre>
