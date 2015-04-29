if [[ `uname` == 'Darwin' ]]; then
    alias ls='ls -Gfh'
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
