if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Useful alias
alias ta='tmux new-session -A -s main'
alias gap='git add --patch'

# Pyenv
set -gx PYENV_ROOT "$HOME/.pyenv"
fish_add_path $PYENV_ROOT/bin
source (pyenv init - | psub)

# Postgres
fish_add_path /Applications/Postgres.app/Contents/Versions/16/bin

# other
fish_add_path $HOME/.local/bin
