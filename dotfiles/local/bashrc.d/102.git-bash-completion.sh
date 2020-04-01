 if [ "$(uname)" == "Linux" ]; then
    . /usr/share/bash-completion/completions/git
 fi

 if [ "$(uname)" == "Darwin" ]; then
     . ~/.local/share/bash-completions/git
 fi
