COLORSCHEME='gruvbox'
COLOR='dark'

function day() {
    sed -i 's/dark\b/light/g' $HOME/.colorscheme
    alacritty-colorscheme apply $COLORSCHEME-light.yaml
		COLOR='light'
}

function night() {
    sed -i 's/light\b/dark/g' $HOME/.colorscheme
    alacritty-colorscheme apply $COLORSCHEME-dark.yaml
		COLOR='dark'
}

function toggle() {
	if [[ $COLOR == 'dark' ]]; then
    sed -i 's/dark\b/light/g' $HOME/.colorscheme
	elif [[ condition ]]; then
    sed -i 's/light\b/dark/g' $HOME/.colorscheme
	fi
		alacritty-colorscheme toggle $COLORSCHEME-light.yaml $COLORSCHEME-dark.yaml
}

