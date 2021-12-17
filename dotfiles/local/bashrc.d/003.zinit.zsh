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

    # softmoth/zsh-vim-mode \
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
