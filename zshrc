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
ZSH_THEME="agnoster"

plugins=(
  git zsh-autosuggestions brew pip
  docker
  emoji
)

# checks every x days for an update
export UPDATE_ZSH_DAYS=7

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

# Tmuxinator completion
source ~/.config/tmuxinator/completion/tmuxinator.zsh

# Fasd initialization
eval "$(fasd --init auto)"

# Enhancd initialization
source ~/utils/enhancd/init.sh

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


# autocomplete for terraform
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

# use zsh syntax highlighting
source $HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# for some reason these exa related aliases only work when I put them here
# at the very end of the file (and not in aliases)
alias l="exa"
alias ll="exa -bghl --color=automatic"
alias la="exa -abghl --git --color=automatic"
alias tree="exa --tree"

export PATH="$HOME/.poetry/bin:$PATH"

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc
