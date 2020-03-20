# export PATH="/home/g/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
