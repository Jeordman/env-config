Install yarn (for prettier install)
https://classic.yarnpkg.com/en/docs/install

Install Iterm2
https://iterm2.com/downloads.html

Install Ripgrep
```
$ brew install ripgrep
```

Install tmux
```
$ brew install tmux
```

Install neovim
https://github.com/neovim/neovim
1) Download nvim-macos.tar.gz
2) Extract: tar xzvf nvim-macos.tar.gz
3) Run ./nvim-osx64/bin/nvim

make a pointer in bash profile pointing at ^

Install Python
```
python3 -m pip install --user --upgrade pynvim
```

Install neovim extensions
1) open ```~/.config/nvim/init.vim```
2) run :PlugInstall
3) run :CocInstall
4) run :CocConfig
5) paste this:
```
{
  "diagnostic.virtualText": true,
  "diagnostic.virtualTextCurrentLineOnly": false
}
```


## ubuntu

Remap escape tool - additional layout options
```
sudo apt-get install gnome-tweak-tool
```

