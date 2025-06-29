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
ZSH_THEME="robbyrussell"
#
# checks every x days for an update
export UPDATE_ZSH_DAYS=7

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  brew
  pip
  docker
  emoji
)

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
export ZSH_CUSTOM=$ZSH/custom


# --------------------------------------------------------------
# User configuration
# --------------------------------------------------------------
source $ZSH/oh-my-zsh.sh

# Run tmux on start
if which tmux >/dev/null 2>&1; then
  # if no session is started, start a new session
  test -z ${TMUX} && tmux
  # when quitting tmux, try to attach
  while test -z ${TMUX}; do
    tmux attach || break
  done
fi

# FZF Initialization
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# use pyenv python version manager
# eval "$(pyenv init -)"  # for older pyenv versions
eval "$(pyenv init --path)"  # for newer pyenv versions

# for some reason these exa related aliases only work when I put them here
# at the very end of the file (and not in aliases)
alias l="exa"
alias ll="exa -bghl --color=automatic"
alias la="exa -abghl --git --color=automatic"
alias tree="exa --tree"

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc


# --------------------------------------------------------------
# ZPLUG plugin manager
# --------------------------------------------------------------
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "b4b4r07/enhancd", use:init.sh
# use fuzzy finder
export ENHANCD_FILTER=fzf


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

export PATH="/opt/homebrew/opt/gnu-getopt/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/d.lutscher/software/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/d.lutscher/software/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/d.lutscher/software/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/d.lutscher/software/google-cloud-sdk/completion.zsh.inc'; fi
