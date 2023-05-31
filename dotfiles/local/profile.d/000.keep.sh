export VISUAL=vim
export TERMINAL=alacritty
export WAYLAND_DISPLAY
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland
export MOZ_ENABLE_WAYLAND=1

export QT_WAYLAND_FORCE_DPI=physical # Use monitor DPI
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1 # Disable window decos

[[ -f ~/.bashrc ]] && . ~/.bashrc
