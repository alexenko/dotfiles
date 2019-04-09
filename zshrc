export ZSH="$HOME/lib/oh-my-zsh"
export ZSH_THEME="fishy"
export DISABLE_AUTO_UPDATE="true"
export OH_MY_ZSH_DEBUG="false"
plugins=(git command-coloring pip fabric lein redis-cli vagrant)

source $ZSH/oh-my-zsh.sh

# Custom options -------------------------------------------------------------
unsetopt promptcr

# Useful aliases -------------------------------------------------------------
# .env loading in the shell
dotenv () {
  if [[ -f .env ]]; then
    set -a
    source .env
    set +a
  fi
}

# Run dotenv on login
# dotenv

# Run dotenv on every new directory
# cd () {
#   builtin cd $@
#   dotenv
# }
alias vz='vim ~/.zshrc'
alias pm='python manage.py'
alias pmt='python manage.py test --settings=coursly.settings.test'
pmc() {coverage run --branch --source="." manage.py test "$*" --settings=coursly.settings.test; coverage html --omit="*migrations*"}
django_reset () { python manage.py sqlreset "$*" | sed 's/DROP TABLE \(.*\);/DROP TABLE \1 CASCADE;/g' | python manage.py dbshell ; }
alias gap='git add --patch'

export DISABLE_AUTO_TITLE="true"

# Environment variables ------------------------------------------------------
export EDITOR='vim'
export PATH="$HOME/bin:${PATH}"
export PATH="$HOME/lib/dotfiles/bin:${PATH}"
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:/opt/local/bin:$PATH"
export PATH="/opt/python/current/bin:$PATH"
export GREP_OPTIONS='--color=auto'
export HISTSIZE=1000
export HISTFILESIZE=1000
export HISTCONTROL=erasedups
export COMMAND_MODE=unix2003

# Python variables -----------------------------------------------------------
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

### PyEnv
if command -v pyenv 1>/dev/null 2>&1; then
	eval "$(pyenv init -)"
fi

### Pipsi
export PATH="/Users/agavrilenko/.local/bin:$PATH"

### pip download cache
export PIP_DOWNLOAD_CACHE="$HOME/.pip/cache"

### pyenv and pyenv-virtualenvwrapper vars
export PROJECT_HOME=${HOME}/code
export WORKON_HOME=${HOME}/.virtualenvs
export VIRTUALENVWRAPPER_HOOK_DIR=${HOME}/lib/dotfiles/virtualenvwrapper
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
pyenv virtualenvwrapper

### Needed for psycopg2
export PATH="${PATH}:/Applications/Postgres.app/Contents/Versions/9.6/bin"

# Local Settings -------------------------------------------------------------
if [[ -s $HOME/.zshrc_local ]] ; then source $HOME/.zshrc_local ; fi

