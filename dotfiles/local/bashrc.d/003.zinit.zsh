zinit for \
    light-mode  zsh-users/zsh-autosuggestions \
    light-mode  zdharma/fast-syntax-highlighting \
                zdharma/history-search-multi-word \
    light-mode ChrisPenner/copy-pasta \
    light-mode ytakahashi/igit \
    light-mode softmoth/zsh-vim-mode

zinit light denysdovhan/spaceship-prompt
# SPACESHIP_CHAR_SYMBOL="❯ "
SPACESHIP_CHAR_SYMBOL="❱ "  
SPACESHIP_PROMPT_ORDER=(
    pyenv user host char
)
SPACESHIP_RPROMPT_ORDER=( dir git docker)
SPACESHIP_CHAR_COLOR_FAILURE=208
SPACESHIP_CHAR_COLOR_SUCCESS=225
SPACESHIP_PYENV_SYMBOL="∫"
