#! /bin/bash

# FOR ARCH

sudo pacman -S neovim

# install plug for neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
       
sudo pacman -S npm

sudo pacman -S tmux
