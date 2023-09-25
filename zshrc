export ZSH="$HOME/lib/oh-my-zsh"
export ZSH_THEME="fishy"
export DISABLE_AUTO_UPDATE="true"
export OH_MY_ZSH_DEBUG="false"
plugins=(tmux git fabric lein redis-cli)

source $ZSH/oh-my-zsh.sh

# Custom options -------------------------------------------------------------
unsetopt promptcr

# Useful aliases -------------------------------------------------------------
# .env loading in the shell
cleanenv() {
	unset DJANGO_SETTINGS_MODULE SECRET_KEY DATABASE_URL DJANGO_SETTINGS_MODULE ALLOWED_HOSTS DEBUG AWS_QUEUE_ARN ENVIRONMENT LOGIN_HOUR_THROTTLE LOGIN_DAY_THROTTLE CORS_ORIGIN_REGEX_WHITELIST DEFAULT_REDIS_CACHE LOGIN_THROTTLE_REDIS_CACHE LOGIN_THROTTLE_CACHE_NAME
}

dotenv () {
	if  [[ $# -ne 1 ]]
	then
		envfile=".local.env"
	else
		envfile=$1;
	fi

 	if [[ -f $envfile ]]
 	then
		cleanenv
		set -a
		source $envfile
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
alias vt='vim ~/.tmux.conf'
alias resource='source ~/.zshrc'
alias pm='python manage.py'
alias awsprod='aws --profile=prod'
alias pmt='python manage.py test --settings=coursly.settings.test'
pmc() {coverage run --branch --source="." manage.py test "$*" --settings=coursly.settings.test; coverage html --omit="*migrations*"}
django_reset () { python manage.py sqlreset "$*" | sed 's/DROP TABLE \(.*\);/DROP TABLE \1 CASCADE;/g' | python manage.py dbshell ; }
alias gap='git add --patch'
fnnl() {find . -type f -print0 | xargs -0 -L1 bash -c 'test "$(tail -c 1 "$0")" && echo "No new line at end of $0"'}
alias mr='!f() { [[ $# -ne 2 ]] && echo "usage is git mr <branch> <target>" || git push origin $1 -o merge_request.create -o merge_request.target=${2} -o merge_request.remove_source_branch; }; f'
mkvenv () {
	if [[ -d ${HOME}/.pyenv/versions/$2 ]]; then
		echo "virtualenv already exists"
		exit 1
	fi
	mkdir -p ${HOME}/code/$2
	pyenv virtualenv $1 $2
	cd ${HOME}/code/$2
	pyenv activate $2
}
workon (){
	pyenv activate $1
	cd ${HOME}/code/$1
}

export DISABLE_AUTO_TITLE="true"

# Environment variables ------------------------------------------------------
export EDITOR='vim'
export PATH="$HOME/bin:${PATH}"
export GREP_OPTIONS='--color=auto'
export COMMAND_MODE=unix2003
export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8
export AWS_PROFILE=dev

# ZSH history opts
export HISTFILE=${HOME}/lib/dotfiles/.zsh_history
export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export SAVEHIST=${HISTSIZE}
setopt hist_ignore_all_dups
setopt hist_ignore_space

### Use brew's openssl instead of OSX's
# brew install openssl zlib readling sqlite bzip2
export CPPFLAGS="-I/usr/local/opt/openssl@3/include -I/usr/local/opt/zlib/include -I/usr/local/opt/readline/include -I/usr/local/opt/sqlite/include -I/usr/local/opt/bzip2/include"
export LDFLAGS="-L/usr/local/opt/openssl@3/lib -L/usr/local/opt/zlib/lib -L/usr/local/opt/readline/lib -L/usr/local/opt/sqlite/lib -L/usr/local/opt/bzip2/lib"


# ### python and pipsi
# export PATH="/opt/python/3.8.9/bin:$PATH"
# export PATH="/Users/agavrilenko/.local/bin:$PATH"

### pip download cache
export PIP_DOWNLOAD_CACHE="$HOME/.pip/cache"

### virtualenvwrapper vars
# export PROJECT_HOME=${HOME}/code
# export WORKON_HOME=${HOME}/.virtualenvs
# export VIRTUALENVWRAPPER_HOOK_DIR=${HOME}/lib/dotfiles/virtualenvwrapper
# export VIRTUALENVWRAPPER_PYTHON="/opt/python/3.8.9/bin/python3.8"
# if [[ -s $HOME/.local/bin/virtualenvwrapper.sh ]] ; then source $HOME/.local/bin/virtualenvwrapper.sh ; fi

### Needed for psycopg2
# Download from https://postgresapp.com/downloads.html
export PATH="${PATH}:/Applications/Postgres.app/Contents/Versions/14/bin"

# Local Settings -------------------------------------------------------------
if [[ -s $HOME/.zshrc_local ]] ; then source $HOME/.zshrc_local ; fi

# pyenv settings
# brew install pyenv pyenv-virtualenv
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
