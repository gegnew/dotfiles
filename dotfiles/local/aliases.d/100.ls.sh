# some more ls aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

if [ "$(uname)" == "Darwin" ]; then
    unalias ls
    alias ll='ls -AlHG'
    alias la='ls -AG'
    alias l='ls -CFG'
fi
