if [[ $(uname) == 'Darwin' ]]; then
    unalias l
    alias ls='ls -FGh'
    alias l='ls'
    alias vi='vim'

    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi

    export PATH=/usr/local/mysql/bin:$PATH

    # ncurses setting
    export PATH="/usr/local/opt/ncurses/bin:$PATH"
    export LDFLAGS="-L/usr/local/opt/ncurses/lib"
    export CPPFLAGS="-I/usr/local/opt/ncurses/include"
    export PKG_CONFIG_PATH="/usr/local/opt/ncurses/lib/pkgconfig"

    [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
fi
