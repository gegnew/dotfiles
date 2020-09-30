# install fzf completions if they dont exist
#[ ! -f ~/.fzf.bash ] && /usr/local/opt/fzf/install
# remove the zsh completions
#[ -f ~/.fzf.zsh ] && rm ~/.fzf.zsh

# source it
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.fzf ] && source ~/.fzf
