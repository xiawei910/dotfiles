#!/bin/bash
# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#Speed up for download in Mainland China
#export HOMEBREW_BOTTLE_DOMAIN=http://7xkcej.dl1.z0.glb.clouddn.com
#echo "export HOMEBREW_BOTTLE_DOMAIN=http://7xkcej.dl1.z0.glb.clouddn.com" >> ~/.bash_profile
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
echo "export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles" >> ~/.bash_profile

# Update homebrew recipes
brew update

brew tap homebrew/dupes
brew tap homebrew/science

##### Install system tools #####
#brew install zsh
brew install wget
brew install diffutils
brew install findutils --with-default-names
brew install gawk
brew install gnu-sed --with-default-names
brew install gnu-tar --with-default-names
brew install gnu-which --with-default-names
brew install grep --with-default-names
brew install gzip
brew install watch
brew install unzip
brew install less
brew install openssh --with-brewed-openssl
brew install tmux
#brew install file-formula
#brew install ed --with-default-names
#brew install gnu-indent --with-default-names
#brew install gnutls --with-default-names
#brew install screen
#brew install wdiff --with-gettext
#brew install coreutils
#brew install binutils



##### For coding #####
brew install gcc
brew install gdb
brew install git
#brew install svn
brew install make
#brew install python --with-brewed-openssl
#brew install gpatch
#brew install nano
#brew install emacs
#brew install m4
#brew install go
#brew install sbt
#brew install scala
brew install node
brew install mongodb
#brew install apache-spark
#brew install pyqt
#brew install ag
#brew install perl518   # must run "brew tap homebrew/versions" first!
#brew install rsync
brew install phantomjs



##### Vim #####
brew install vim --override-system-vi --with-lua
#brew install macvim --override-system-vim --custom-system-icons --with-lua


brew cask install atom
brew cask install iina
