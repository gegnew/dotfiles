# specify a password for non-interactive use
# export BORG_PASSPHRASE='bliss'
# specify the default repository to use for backups
# export BORG_REPO='18420@ch-s011.rsync.net:home'
# borg create ::$(hostname)-$(date -I) /folder/to/back/up
# 0 13 * * * borg create --exclude "$HOME/.cache" UID@ch-s011.rsync.net:home::"$(date -u '+%Y%m%d')" "$HOME"
