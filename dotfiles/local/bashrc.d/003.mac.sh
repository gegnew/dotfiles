#!/usr/bin/env bash

 if [ "$(uname)" == "Darwin" ]; then
     export PATH=/Users/munich-spare1/.local/bin:$PATH # for ipython and pygmentize
    # add gsed to path
    # export PATH="/usr/local/opt/gnu-sed/libexec/gnubin/:$PATH"
    # add gawk to path
    # export PATH="/usr/local/opt/gawk/libexec/awk/:$PATH"
    # add ggrep to path
    # export PATH="/usr/local/opt/gnu-sed/libexec/gnubin/:$PATH"

    # get italics for iterm (may for other things too?)
    # curl -L https://gist.githubusercontent.com/sos4nt/3187620/raw/bca247b4f86da6be4f60a69b9b380a11de804d1e/xterm-256color-italic.terminfo -o xterm-256color-italic.terminfo
    # tic xterm-256color-italic.terminfo
    export TERM=xterm-256color-italic
 fi
