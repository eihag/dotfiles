Setup development workstation
==========
These are my .dotfiles. There are many like them, but these ones are mine.

# OSX
Install HomeBrew + Zsh + Oh-my-Zsh and more
<pre><code>
cd ~
git clone https://github.com/eihag/dotfiles.git
~/dotfiles/install.sh
</code></pre>


# Chrome 
#### Plugins
* adblock plus
* ghostery
* https everywhere

#### Settings

chrome://settings/content
Block
* notifications
* camera
* microphone
* location
* sound
* 3rd party cookies

Set autoplay policy: [chrome://flags/#autoplay-policy](chrome://flags/#autoplay-policy) - No longer working :(

Disable Chrome sign-in:  chrome://settings/privacy -> Allow Chrome sign-in -> OFF. 

# Intellij plugins
* .ignore
* AWS Cloudformation
* Checkstyle-IDEA
* Findbugs-IDEA
* Markdown support
* Python Community Edition
* Save Actions
* YAML
* Nyan Progress Bar

# Windows
Download here: https://cygwin.com/install.html
<pre><code>
setup-x86_64.exe --upgrade-also --packages curl,diffutils,git,git-svn,grep,gzip,ncurses,openssh,python,ruby,tar,vim,wget,zsh
ln -s $USERPROFILE/.ssh ~

git clone git://github.com/joelthelion/autojump.git ~/zsh-config/autojump
cd autojump
./install.py
</code></pre>
Tip: Clean windows path of unused PATH entries - speeds up cygwin considerably!
