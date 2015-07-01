# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pure"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git atom ruby sudo jsontools zsh-syntax-highlighting hub)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/bin:/usr/local/lib:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export GOPATH="$HOME/gopath"
export PATH="$GOPATH/bin:$PATH"
export ASDKPATH="/Users/seke/code/android-sdk-macosx"
export PATH="$ASDKPATH:$PATH"
export VIRTUALENVWRAPPER_PYTHON=$(brew --prefix)/bin/python
 if [ -f $(brew --prefix)/bin/virtualenvwrapper_lazy.sh ]; then
   . $(brew --prefix)/bin/virtualenvwrapper_lazy.sh
 fi

function pr () {
  repo=`git remote -v | grep -m 1 "(push)" | sed -e "s/.*github.com[:/]\(.*\)\.git.*/\1/"`
  branch=`git name-rev --name-only HEAD`
  echo "... creating pull request for branch \"$branch\" in \"$repo\""
  open https://github.com/$repo/pull/new/$branch
}


# NVM
source $(brew --prefix nvm)/nvm.sh
export NVM_DIR=~/.nvm
#SPM
alias spm="npm -reg http://npm-registry.spotify.net -userconfig ~/.spmrc"
# export MANPATH="/usr/local/man:$MANPATH"


# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias vi="vim"
alias rm="trash -v"
# alias to love
alias love="/Applications/love.app/Contents/MacOS/love"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export EDITOR='vim'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
function puclient() {
        export SERVER=awseu3-productusertesting-b1.shared.cloud.spotify.net
        export PORT=6101
        export ADDR=/RPC2
        if [[ -n $1 ]]; then SERVER=$1; fi
        if [[ -n $2 ]]; then PORT=$2; fi
        if [[ -n $3 ]]; then ADDR=$3; fi
        python -ic "import xmlrpclib; from pprint import pprint as pp; pu = xmlrpclib.ServerProxy('http://$SERVER:$PORT$ADDR', allow_none=True);  d = xmlrpclib.ServerProxy('http://$SERVER:5120', allow_none=True); api = xmlrpclib.ServerProxy('http://$SERVER:6100', allow_none=True); co = xmlrpclib.ServerProxy('http://$SERVER:5220', allow_none=True); print pu; print d; print api; print co"
}
function pulocal() {
        export SERVER=localhost
        export PORT=5101
        export ADDR=/RPC2
        if [[ -n $1 ]]; then SERVER=$1; fi
        if [[ -n $2 ]]; then PORT=$2; fi
        if [[ -n $3 ]]; then ADDR=$3; fi
        python -ic "import xmlrpclib; from pprint import pprint as pp; pu = xmlrpclib.ServerProxy('http://$SERVER:$PORT$ADDR', allow_none=True);  d = xmlrpclib.ServerProxy('http://$SERVER:5120', allow_none=True); api = xmlrpclib.ServerProxy('http://$SERVER:5180', allow_none=True); co = xmlrpclib.ServerProxy('http://$SERVER:5220', allow_none=True); print pu; print d; print api; print co"
}
function note() {
  touch ~/Documents/Notes/$1.md
  atom ~/Documents/Notes/$1.md
}
source ~/.bin/tmuxinator.zsh
if [ -f /usr/local/bin/virtualenvwrapper_lazy.sh ]; then
  . /usr/local/bin/virtualenvwrapper_lazy.sh
  workon spotify
fi