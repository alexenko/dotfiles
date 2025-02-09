if ! command -qs tmux
	exit
end

test -d ~/.config/tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

link_file $DOTFILES_ROOT/tmux/tmux.conf $HOME/.config/tmux/tmux.conf
	or abort tmux
