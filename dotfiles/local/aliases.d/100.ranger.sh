#make ranger easy
alias r='ranger'
alias rr='sudo ranger'

# if lf exists, we'll use that
LFCD="/home/g/.config/lf/lfcd.sh"                                #  pre-built binary, make sure to use absolute path
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi

#alias ranger or lf to exit in directory navigated to
if command -v lf &> /dev/null; then
    alias ranger='lfcd'
elif command -v ranger; then
    alias ranger='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'
fi

