#!/usr/bin/env bash

cd $HOME

if [ -d "dotfiles" ]; then
	cd dotfiles
	git pull --autostash
	cd ..
else
	git clone https://github.com/eihag/dotfiles.git
fi

XCODE_ENV=`xcode-select -p`
if [ ! "$XCODE_ENV" = "/Library/Developer/CommandLineTools" ] && [ ! "$XCODE_ENV" = "/Applications/Xcode.app/Contents/Developer" ]; then
	# echo Xcode license
	# sudo xcodebuild -license accept
	xcode-select --install
	echo Press Enter when XCode command line tools is installed
	read -n 1  key
fi

if [ ! -f "/opt/homebrew/bin/brew" ]; then
	echo Installing Homebrew
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	/opt/homebrew/bin/brew analytics off
	/opt/homebrew/bin/brew tap homebrew/cask-versions

	sudo softwareupdate --install-rosetta
else
	/opt/homebrew/bin/brew update
	/opt/homebrew/bin/brew upgrade
	/opt/homebrew/bin/brew upgrade --cask
	/opt/homebrew/bin/brew autoremove
fi

if [ ! -f "$HOME/.Brewfile" ]; then
	ln -s $HOME/dotfiles/Brewfile-work $HOME/.Brewfile
fi

/opt/homebrew/bin/brew bundle --global

pip3 install --upgrade pip
pip3 install -r $HOME/dotfiles/requirements.txt 
pip-review --auto

if [ ! -d "$HOME/.rvm" ]; then
	echo Installing RVM
	gpg --keyserver pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
	curl -sSL https://get.rvm.io | bash -s stable
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
	echo Installing Oh-my-zsh + prompt
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone https://gist.github.com/1142716.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/zanshin
fi

if [ ! -d "$HOME/icloud" ]; then
	ln -s $HOME/Library/Mobile\ Documents/com~apple~CloudDocs $HOME/icloud
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

if [ ! -f "$HOME/.gitignore" ]; then
  ln -s $HOME/dotfiles/gitignore $HOME/.gitignore
fi

for dir in /Library/Java/JavaVirtualMachines/*/
do
	echo Adding jdk ${dir}	
	jenv add ${dir}/Contents/Home
done
# for dir in /usr/local/Cellar/openjdk/*/
# do
#	echo Adding jdk ${dir}	
# 	jenv add ${dir}
# done
#jenv global 19.0

jenv rehash
jenv disable-plugin maven
eval `jenv "sh-enable-plugin" "maven"`
eval `jenv "sh-enable-plugin" "export"`

brew cleanup -s --prune=14
