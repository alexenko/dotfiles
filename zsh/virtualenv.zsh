# Virtualenv and virtualenvwrapper setup
if [[ -f /opt/python/bin/virtualenvwrapper.sh ]]; then
#    export PROJECT_HOME=~/lib/virtualenvs
    export WORKON_HOME=${HOME}/Code
    export VIRTUALENVWRAPPER_HOOK_DIR=${HOME}/lib/virtualenvs
    export VIRTUALENVWRAPPER_LOG_DIR=${HOME}/lib/virtualenvs
    export PIP_VIRTUALENV_BASE=$WORKON_HOME
    export PIP_RESPECT_VIRTUALENV=true
    export PIP_DOWNLOAD_CACHE="$HOME/.pip/cache"
    export VIRTUALENV_PROJECT_GIT_ROOT=${HOME}/Code/repos
	export VIRTUALENVWRAPPER_PYTHON="/opt/python/bin/python"
	export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages --distribute'
    source /opt/python/bin/virtualenvwrapper.sh
fi


