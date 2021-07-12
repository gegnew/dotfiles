function day() {
    sed -i 's/dark\b/light/g' /home/g/.colorscheme
    # sed -i 's/ayu\b/gruvbox/g' /home/g/.colorscheme
    alacritty-colorscheme apply gruvbox-light.yaml
}

function night() {
    sed -i 's/light\b/dark/g' /home/g/.colorscheme
    alacritty-colorscheme apply ayu-dark.yaml
}
