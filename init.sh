#!/bin/bash

if [ -s ~/.vimrc ]
then
  mv ~/.vimrc ~/.vimrc.bak
fi

if [ -s ~/.zshrc ]
then
  mv ~/.zshrc ~/.zshrc.bak
fi

curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

ln -s $(pwd)/vimrc ~/.vimrc
ln -s $(pwd)/zshrc ~/.zshrc
