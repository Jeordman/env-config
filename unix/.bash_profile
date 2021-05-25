# include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

# --------
# Aliases
# --------
alias v="~/squashfs-root/AppRun"

alias dcst="docker-compose start"
alias dcu="docker-compose up -d"
alias dcsp="docker-compose stop"
alias dcd="docker-compose down"
alias dcb="docker-compose build"
