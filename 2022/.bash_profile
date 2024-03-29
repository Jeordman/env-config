export VISUAL=vim
export EDITOR="nvim"
export EDITOR="$VISUAL"

# 2 rocket ships -> pwd in color blue, type in white
export PS1="🌳 \[\033[01;36m\]\w 🌳 :  \[\033[01;37m\]"


export BASH_SILENCE_DEPRECATION_WARNING=1

dexec() {
    docker exec -it "$1" /bin/bash
    echo "$1"
}

# Vim controls
alias init="v ~/.config/nvim/init.vim"
alias vimrc="v ~/.config/nvim/init.vim"
alias v="~/nvim-osx64/bin/nvim"
alias profile="v ~/.bash_profile"


alias backoffice="cd ~/younique/backoffice"
alias commission_engine="cd ~/younique/commission_engine"
alias danzek="cd ~/younique/danzek"
alias leela="cd ~/younique/leela"
alias ycode="cd ~/younique/leela/code"
