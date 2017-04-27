#!/bin/bash

if [ ! -s ~/.vimrc ]
then
  mv ~/.vimrc ~/.vimrc.bak
fi

if [ ! -s ~/.config/fish/config.fish ]
then
  mv ~/.config/fish/config.fish ~/.config/fish/config.fish.bak
fi

ln -s $(pwd)/vimrc ~/.vimrc
ln -s $(pwd)/config.fish ~/.config/fish/config.fish

