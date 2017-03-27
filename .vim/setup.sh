#! /bin/bash
VIM_HOME=$HOME'/.vim/'
if [ ! -d $VIM_HOME ]
then
    mkdir -p -m700 $VIM_HOME
fi

VIM_RC_DIR=$VIM_HOME'/vimrcs/'
if [ ! -d $VIM_RC_DIR ]
then
    mkdir -p -m700 $VIM_RC_DIR
fi

cp $PWD'/vimrc' $HOME'/.vimrc'
cp $PWD'/vimrc.vim' $VIM_RC_DIR
cp $PWD'/bundles.vim' $VIM_RC_DIR
