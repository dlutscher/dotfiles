export SDKROOT="/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk"
export PATH="/opt/homebrew/bin:/Users/daniel/Library/Python/3.9/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:$PATH"

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

# Updates PATH for the Google Cloud SDK
source $HOME/software/google-cloud-sdk/path.zsh.inc

# Enables zsh completion for gcloud.
source $HOME/software/google-cloud-sdk/completion.zsh.inc

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

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
export PATH="$HOME/.pyenv/bin:$PATH"


### Add these next lines to protect your system python from
### pollution from 3rd-party packages
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# commands to override pip restriction above.
# use `gpip` or `gpip3` to force installation of
# a package in the global python environment
# Never do this! It is just an escape hatch.
gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
gpip3(){
   PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}
