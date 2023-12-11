#!/usr/bin/env fish
curl -sL https://raw.githubusercontent.com/catppuccin/alacritty/main/catppuccin-macchiato.yml -o $HOME/lib/dotfiles/alacritty/catppuccin.yml
link_file $DOTFILES_ROOT/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml backup
	or abort alacritty
