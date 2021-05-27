#! /bin/bash

# FOR UBUNTU

sudo apt install neovim

sudo apt install ripgrep

# install plug for neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
       
sudo apt install npm

sudo apt install tmux
