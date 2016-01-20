#!/bin/bash
cd ~
mv ~/.vimrc ~/.vimrc.bak
rm -rf ~/.vim
rm -rf ~/.vim_tmp
ln -s ~/.dotfiles/vimrc .vimrc
ln -s ~/.dotfiles/vim_runtime .vim_runtime
mkdir -p ~/.vim_tmp/undodir
mkdir -p ~/.vim_tmp/backup
mv ~/.bash_profile ~/.bash_profile.bak
ln -s ~/.dotfiles/bash_profile .bash_profile
mv ~/.tmux.conf .tmux.conf.bak
ln -s ~/.dotfiles/tmux.conf .tmux.conf

bash ./setup.sh

