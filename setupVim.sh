#!/bin/bash -i

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl https://raw.githubusercontent.com/GumGun-misc/vimConfig/main/.vimrc > ~/.vimrc
mkdir -p ~/.vim/swp/ ~/.vim/backups/
[ `alias | grep -e 'alias v=' | wc -l` != 1  ] && echo "alias v='vim'" >> ~/.bashrc
alias v='vim'
vim - -c 'PlugInstall' -c 'qa!'
