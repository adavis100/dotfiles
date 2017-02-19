#!/bin/bash

if [ -s ~/.vimrc ]
then
  mv ~/.vimrc ~/.vimrc.bak
fi

if [ -s ~/.zshrc ]
then
  mv ~/.zshrc ~/.zshrc.bak
fi

ln -s $(pwd)/vimrc ~/.vimrc
ln -s $(pwd)/zshrc ~/.zshrc
