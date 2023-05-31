# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
setopt autocd extendedglob notify
unsetopt beep nomatch

bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
# bindkey '^R' history-incremental-search-backward
# bindkey "^?" backward-delete-char

# Where to look for autoloaded function definitions
fpath=(~/.zfunc $fpath)

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/g/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
autoload bashcompinit
bashcompinit

# for bcfile in ~/.bash_completion.d/* ; do
#   . $bcfile
# done

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# End of Zinit's installer chunk


# python venvs
# if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
#   source "${VIRTUAL_ENV}/bin/activate"
# fi

# FZF convenience bindings
# TODO: re-download these
# . "$HOME/.local/fzf-gems/fzf_git_functions.sh"
# . "$HOME/.local/fzf-gems/fzf_git_keybindings.zsh"

# export LC_CTYPE=en_US.UTF-8
#
# zstyle ':autocomplete:tab:*' fzf-completion yes
#