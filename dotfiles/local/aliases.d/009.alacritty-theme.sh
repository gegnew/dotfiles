COLORSCHEME='base16-gruvbox'
COLOR='dark'

function day() {
    sed -i 's/dark\b/light/g' $HOME/.colorscheme
    echo 'you gonna regret this later probably'
    # alacritty-colorscheme apply $COLORSCHEME-light-medium.yml
		# COLOR='light'
}

function night() {
    sed -i 's/light\b/dark/g' $HOME/.colorscheme
    echo 'you gonna regret this later probably'
    # alacritty-colorscheme apply $COLORSCHEME-dark-medium.yml
		# COLOR='dark'
}

function toggle() {
	if [[ $COLOR == 'dark' ]]; then
    sed -i 's/dark\b/light/g' $HOME/.colorscheme
	elif [[ condition ]]; then
    sed -i 's/light\b/dark/g' $HOME/.colorscheme
	fi
lifepillar/vim-gruvbox8		alacritty-colorscheme toggle $COLORSCHEME.yml $COLORSCHEME.yaml
}

