# make ranger easy
alias r='ranger'
alias rr='sudo ranger'

if command -v ranger &>/dev/null; then
    alias ranger='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'
fi

# use xplr instead

# change dir with Enter
# alias r='cd "$(xplr --print-pwd-as-result)"'
