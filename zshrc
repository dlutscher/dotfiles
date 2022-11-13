# set homebrew path with all its installed software
# evaluating this bit before calling any aliases etc. to be sure
# that all apps are found
eval "$(/opt/homebrew/bin/brew shellenv)"


# --------------------------------------------------------------
# Sourcing additional files
# --------------------------------------------------------------
# first go through all export and alias statements
source ~/.exports
source ~/.aliases

# secrets we might have saved as env variables
# it's gitignored so the file must be created if manually
source ~/.secrets

# it's gitignored so the file must be created if manually
source ~/.custom


# --------------------------------------------------------------
# ZSH configurations
# --------------------------------------------------------------
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 7

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
export ZSH_CUSTOM=$ZSH/custom

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


# --------------------------------------------------------------
# User configuration
# --------------------------------------------------------------

# Fasd initialization
eval "$(fasd --init auto)"

# FZF Initialization
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Tmuxinator completion
# source ~/.config/tmuxinator/completion/tmuxinator.zsh


# use pyenv python version manager
eval "$(pyenv init -)"  # for older pyenv versions
# activate pyenv-virtualenv
eval "$(pyenv virtualenv-init -)"


# Run tmux on start
if which tmux >/dev/null 2>&1; then
  # if no session is started, start a new session
  test -z ${TMUX} && tmux
  # when quitting tmux, try to attach
  while test -z ${TMUX}; do
    tmux attach || break
  done
fi


# for some reason these exa related aliases only work when I put them here
# at the very end of the file (and not in aliases)
alias l="exa"
alias ll="exa -bghl --color=automatic"
alias la="exa -abghl --git --color=automatic"
alias tree="exa --tree"


# --------------------------------------------------------------
# ZPLUG plugin manager
# --------------------------------------------------------------
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "b4b4r07/enhancd", use:init.sh
# export ENHANCD_FILTER=fzy

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# adding llvm (C++ compiler package) for pyenv installing python versions
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

