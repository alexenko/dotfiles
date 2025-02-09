#!/usr/bin/env fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
	and success 'fisher'
	or abort 'fisher'

mkdir -p $__fish_config_dir/completions/
	and success 'completions'
	or abort 'completions'

link_file $DOTFILES_ROOT/fish/plugins $__fish_config_dir/fish_plugins backup

fisher update
	and success 'plugins'
	or abort 'plugins'

set -U fish_greeting

yes | fish_config theme save "Catppuccin Macchiato"
	and success 'colorscheme'
	or abort 'colorscheme'

yes | tide configure --auto --style=Classic --prompt_colors='True color' --classic_prompt_color=Dark --show_time=No --classic_prompt_separators=Angled --powerline_prompt_heads=Sharp --powerline_prompt_tails=Flat --powerline_prompt_style='Two lines, character' --prompt_connection=Disconnected --powerline_right_prompt_frame=No --prompt_spacing=Sparse --icons='Many icons' --transient=No
	and success 'prompt style'
	or abort 'prompt style'

set -a tide_right_prompt_items git && set tide_left_prompt_items os pwd newline character
	and success 'prompt'
	or abort 'prompt'

tide reload

for function_file in $DOTFILES_ROOT/fish/functions/*
	link_file $function_file $__fish_config_dir/functions/(basename $function_file) backup
end

link_file $DOTFILES_ROOT/fish/config.fish $__fish_config_dir/config.fish backup

if not grep -q (command -v fish) /etc/shells
	command -v fish | sudo tee -a /etc/shells
		and success 'added fish to /etc/shells'
		or abort 'setup /etc/shells'
end

test (command -v fish) = $SHELL
	and success 'fish installed/updated!'
	and exit 0

chsh -s (command -v fish)
	and success set (fish --version) as the default shell
	or abort 'set fish as default shell'
