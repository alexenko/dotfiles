#!/usr/bin/env fish
curl -sL https://raw.githubusercontent.com/catppuccin/alacritty/main/catppuccin-macchiato.toml -o $HOME/lib/dotfiles/alacritty/catppuccin.toml
link_file $DOTFILES_ROOT/alacritty/alacritty.toml $HOME/.config/alacritty/alacritty.toml backup
	or abort alacritty
