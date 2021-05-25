# include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

# --------
# Aliases
# --------

# Vim controls
alias config="v ~/.config/nvim/init.vim"
alias init="v ~/.config/nvim/init.vim"
alias vimrc="v ~/.config/nvim/init.vim"
alias v="~/squashfs-root/AppRun"
alias profile="v ~/.bash_profile"

alias dcst="docker-compose start"
alias dcu="docker-compose up -d"
alias dcsp="docker-compose stop"
alias dcd="docker-compose down"
alias dcb="docker-compose build"

# Git
# alias gb="git branch"
# alias ga="git add"
# alias gaa="git add ."
# alias gc="git commit -m"
# alias gp="git push"
# alias gs="git status"
# alias gd="git diff"
# alias gcc="git checkout"
# alias gccc="git checkout -b"

# Directory Goto
alias wb="cd ~/conexed-whiteboard"
alias docc="cd ~/doc-converter"
alias hd="cd ~/host-dictionary"
alias api="cd ~/api-craniumcafe"
alias ap="cd ~/archive-player"

# Tag WB Script shorthand
# alias wbtest="~/conexed-whiteboard/scripts && ./docker-send-test.sh"
alias wbtest="~/conexed-whiteboard/scripts/docker-send-test.sh"
alias wbprod="~./conexed-whiteboard/scripts/docker-send-prod.sh"

# Bring up wb in docker
alias wbu="cd ~/conexed-whiteboard && dcu"
alias doccu="cd ~/doc-converter && dcu"
alias hdu="cd ~/host-dictionary && dcu"
alias apiu="cd ~/api-craniumcafe && dcu"
alias apu="cd ~/archive-player && dcu"

# Start wb be and fe
alias wbfe='cd ~/conexed-whiteboard && docker exec -it conexed-whiteboard sh -c "cd src/client && npm install && npm run build:dev-watch"'
alias wbbe='cd ~/conexed-whiteboard && docker exec -it conexed-whiteboard sh -c "npm --prefix src/server install && npm --prefix src/server run dev:watch"'

# Host dictionary interaction
alias hdplay="cd ~/host-dictionary && docker exec -it hd-play bash"

alias c="clear"

# test servers conexed
alias test="ssh -i ~/.ssh/conexed-qa.pem ubuntu@draw-01.test.craniumcafe.com"
