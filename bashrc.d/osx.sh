if [[ $(uname) == 'Darwin' ]]; then
    unalias l
    alias ls='ls -FGh'
    alias l='ls'
    alias vi='vim'

    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi
fi
