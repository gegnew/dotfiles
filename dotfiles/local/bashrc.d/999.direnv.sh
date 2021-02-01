# This is for direnv, as per the website. Must be after RVM
SHILL=$(echo $SHELL | cut -d'/' -f4)
eval "$(direnv hook $SHILL)"
