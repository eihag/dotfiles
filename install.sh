#!/usr/bin/env bash

cd $HOME

if [ -d "dotfiles" ]; then
	cd dotfiles
	git pull
	cd ..
else
	git clone https://github.com/eihag/dotfiles.git
fi

if [ ! -f "/usr/local/bin/brew" ]; then
	echo Installing Homebrew
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	brew update
	brew upgrade
	brew cask upgrade
fi

if [ ! -f "$HOME/.Brewfile" ]; then
	ln -s $HOME/dotfiles/Brewfile $HOME/.Brewfile
fi

brew bundle --global

echo Xcode license
sudo xcodebuild -license accept

if [ ! -d "$HOME/.rvm" ]; then
	echo Installing RVM
	gpg --keyserver pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
	curl -sSL https://get.rvm.io | bash -s stable
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
	echo Installing Oh-my-zsh + prompt
	git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
	git clone https://gist.github.com/1142716.git $HOME/.oh-my-zsh/custom/themes/zanshin
fi


if [ -f "$HOME/.profile" ]; then
	echo $HOME/.profile exists
fi

if [ ! -f "$HOME/.zprofile" ]; then
	echo source $HOME/dotfiles/zprofile>$HOME/.zprofile
fi

if [ ! -f "$HOME/.zshrc" ]; then
	echo source $HOME/dotfiles/zshrc>$HOME/.zshrc
fi

if [ ! -f "$HOME/.aliases" ]; then
	touch $HOME/.aliases
fi

if [ "$SHELL" != "/bin/zsh" ]; then
	chsh -s /bin/zsh 
fi

if [ ! -f "$HOME/.gitconfig" ]; then
	ln -s $HOME/dotfiles/gitconfig $HOME/.gitconfig
fi

for dir in /Library/Java/JavaVirtualMachines/*/
do
	echo Adding jdk ${dir}
	# Note: use --skip-existing when new release of jenv
	jenv add ${dir}/Contents/Home    
done
jenv global 1.8
eval `jenv "sh-enable-plugin" "maven"`
eval `jenv "sh-enable-plugin" "export"`

brew cleanup
