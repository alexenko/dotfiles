export ZSH="$HOME/lib/oh-my-zsh"
export ZSH_THEME="fishy"
export DISABLE_AUTO_UPDATE="true"
export OH_MY_ZSH_DEBUG="true"
plugins=(git command-coloring osx pip fabric lein redis-cli vagrant)

#test -f "$HOME/src/hgd/hd" && export OH_MY_ZSH_HG="$HOME/src/hgd/hd" || export OH_MY_ZSH_HG='hg'

source $ZSH/oh-my-zsh.sh
#source $HOME/lib/dotfiles/z/z.sh

# Custom options -------------------------------------------------------------
unsetopt promptcr

# Useful aliases -------------------------------------------------------------
alias vz='vim ~/.zshrc'
alias pm='python manage.py'
alias pmt='python manage.py test --settings=coursly.settings.test'
pmc() {coverage run --branch --source="." manage.py test "$*" --settings=coursly.settings.test; coverage html --omit="*migrations*"}
django_reset () { python manage.py sqlreset "$*" | sed 's/DROP TABLE \(.*\);/DROP TABLE \1 CASCADE;/g' | python manage.py dbshell ; }
alias gap='git add --patch'

export DISABLE_AUTO_TITLE="true"

# Environment variables ------------------------------------------------------
export EDITOR='vim'
#export PATH="$HOME/.gem/ruby/1.8/bin:${PATH}"
export PATH="$HOME/bin:${PATH}"
export PATH="$HOME/lib/dotfiles/bin:${PATH}"
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:/opt/local/bin:$PATH"
export PATH="/opt/python/current/bin:$PATH"
export GREP_OPTIONS='--color=auto'
export HISTSIZE=1000
export HISTFILESIZE=1000
export HISTCONTROL=erasedups
export COMMAND_MODE=unix2003
export PATH="/Applications/Postgres.app/Contents/Versions/9.5/bin/:${PATH}"
#export RUBYOPT=rubygems
#export CLASSPATH="$CLASSPATH:/usr/local/Cellar/clojure-contrib/1.2.0/clojure-contrib.jar"

# Local Settings -------------------------------------------------------------
if [[ -s $HOME/.zshrc_local ]] ; then source $HOME/.zshrc_local ; fi

# activate virtualenv wrapper
if [[ -s $HOME/lib/dotfiles/zsh/virtualenv.zsh ]] ; then 
	source $HOME/lib/dotfiles/zsh/virtualenv.zsh ;
fi

# Keyboard shortcuts
bindkey -e
bindkey '^[[1;5D' forward-word
bindkey '^[[1;5C' backward-word
