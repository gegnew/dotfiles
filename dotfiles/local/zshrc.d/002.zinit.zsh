export NVM_LAZY_LOAD=true

zinit light-mode for \
    mroth/evalcache \
    lukechilds/zsh-nvm \
    zsh-users/zsh-autosuggestions \
    zdharma/fast-syntax-highlighting \
    zdharma/history-search-multi-word \
    ChrisPenner/copy-pasta \
    ytakahashi/igit \
    agkozak/zsh-z \
    wookayin/fzf-fasd \
    Aloxaf/fzf-tab
    # marlonrichert/zsh-autocomplete

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_BASE="$HOME/.fzf"
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

export PATH="$HOME/.fzf/bin:$PATH"

FZ_HISTORY_CD_CMD=zshz
unalias z
z() {
  if [[ -z "$*" ]]; then
    cd "$(zshz -l 2>&1 | fzf +s --tac | sed 's/^[0-9,.]* *//')"
  else
    _last_z_args="$@"
    _z "$@"
  fi
}

zz() {
  cd "$(zshz -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf -q "$_last_z_args")"
}
alias j=z
alias jj=zz

zinit load ellie/atuin

# alias history="fc -l 1"
#
# # below alias taken from https://github.com/zimfw/history/blob/master/init.zsh
# alias history-stat="fc -ln 0 | awk '{print \$1}' | sort | uniq -c | sort -nr | head"

zinit load MenkeTechnologies/zsh-sed-sub
zinit light laggardkernel/git-ignore

zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT

zinit light denysdovhan/spaceship-prompt
# SPACESHIP_CHAR_SYMBOL="❯ "
SPACESHIP_CHAR_SYMBOL="❱ "
# SPACESHIP_PROMPT_ORDER=(
#     node pyenv php user host char
# )
SPACESHIP_VI_MODE_INSERT=''
SPACESHIP_VI_MODE_NORMAL='n'
SPACESHIP_VI_MODE_PREFIX=''
SPACESHIP_VI_MODE_COLOR='grey'
SPACESHIP_PROMPT_ORDER=(
    vi_mode char
)

TIMETRACE_PROJECT=$(timetrace status --format "{project}")
spaceship_timetrace() {
    spaceship::exists timetrace || return

    if [[ $TIMETRACE_PROJECT != "---" ]]; then
      timetrace_status=$(timetrace status --format "{project} ({trackedTimeCurrent})")
    else
        timetrace_status=''
    fi

    # Exit section if variable is empty
    [[ -z $timetrace_status ]] && return

  spaceship::section "white" \
        ⏳"$timetrace_status"
}
SPACESHIP_RPROMPT_ORDER=( dir git timetrace node pyenv php docker)
SPACESHIP_CHAR_COLOR_FAILURE=208
SPACESHIP_CHAR_COLOR_SUCCESS=225

alias gi="git-ignore"


# eval "$(starship init zsh)" # install globally

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

