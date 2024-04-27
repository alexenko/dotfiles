if ! command -qs tmux
	exit
end

test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

alias --save ta='tmux new-session -A -s main'

link_file $DOTFILES_ROOT/tmux/tmux.conf $HOME/.tmux.conf
	or abort tmux
