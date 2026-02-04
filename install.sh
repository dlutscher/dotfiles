#!/bin/zsh
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

info() { echo -e "${BLUE}[INFO]${NC} $1"; }
success() { echo -e "${GREEN}[OK]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; }

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# ------------------------------------------------------------------------------
# Pre-flight checks
# ------------------------------------------------------------------------------
info "Running pre-flight checks..."

# Check for Xcode Command Line Tools
if ! xcode-select -p &>/dev/null; then
    warn "Xcode Command Line Tools not found. Installing..."
    xcode-select --install
    echo "Please re-run this script after installation completes."
    exit 1
fi
success "Xcode Command Line Tools installed"

# Check for Homebrew
if ! command -v brew &>/dev/null; then
    info "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for Apple Silicon
    if [[ $(uname -m) == "arm64" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
fi
success "Homebrew installed"

# ------------------------------------------------------------------------------
# Homebrew packages
# ------------------------------------------------------------------------------
info "Updating Homebrew..."
brew update

info "Installing packages from Brewfile..."
brew bundle install --file="$DOTFILES_DIR/Brewfile" || warn "Some packages failed to install"

# ------------------------------------------------------------------------------
# Oh My Zsh
# ------------------------------------------------------------------------------
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    info "Installing Oh My Zsh..."
    RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    success "Oh My Zsh already installed"
fi

# Zsh plugins
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    info "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
    success "zsh-autosuggestions already installed"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    info "Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
    success "zsh-syntax-highlighting already installed"
fi

# ------------------------------------------------------------------------------
# Tmux Plugin Manager
# ------------------------------------------------------------------------------
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    info "Installing Tmux Plugin Manager..."
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
else
    success "Tmux Plugin Manager already installed"
fi

# ------------------------------------------------------------------------------
# Enhanced directory navigation (enhancd)
# ------------------------------------------------------------------------------
if [ ! -d "$HOME/utils/enhancd" ]; then
    info "Installing enhancd..."
    mkdir -p "$HOME/utils"
    git clone https://github.com/b4b4r07/enhancd.git "$HOME/utils/enhancd"
else
    success "enhancd already installed"
fi

# ------------------------------------------------------------------------------
# Symlink dotfiles
# ------------------------------------------------------------------------------
info "Creating symlinks..."

create_symlink() {
    local src="$1"
    local dest="$2"

    if [ -L "$dest" ]; then
        # Already a symlink - check if it points to the right place
        if [ "$(readlink "$dest")" = "$src" ]; then
            success "Symlink exists: $dest"
            return
        else
            warn "Updating symlink: $dest"
            rm "$dest"
        fi
    elif [ -e "$dest" ]; then
        # File exists but is not a symlink - back it up
        warn "Backing up existing file: $dest -> ${dest}.backup"
        mv "$dest" "${dest}.backup"
    fi

    ln -s "$src" "$dest"
    success "Created symlink: $dest -> $src"
}

# Create backup directory if needed
mkdir -p "$HOME/.dotfiles_backup"

# Shell config
create_symlink "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
create_symlink "$DOTFILES_DIR/tmux.conf" "$HOME/.tmux.conf"
create_symlink "$DOTFILES_DIR/exports" "$HOME/.exports"
create_symlink "$DOTFILES_DIR/aliases" "$HOME/.aliases"

# Secrets and custom (create empty files if they don't exist in dotfiles)
[ -f "$DOTFILES_DIR/secrets" ] && create_symlink "$DOTFILES_DIR/secrets" "$HOME/.secrets"
[ -f "$DOTFILES_DIR/custom" ] && create_symlink "$DOTFILES_DIR/custom" "$HOME/.custom"

# Bin directory
[ -d "$DOTFILES_DIR/bin" ] && create_symlink "$DOTFILES_DIR/bin" "$HOME/bin"

# Config directory contents (nvim, git, iterm2, etc.)
mkdir -p "$HOME/.config"
for dir in "$DOTFILES_DIR/config"/*; do
    if [ -d "$dir" ]; then
        dir_name=$(basename "$dir")
        create_symlink "$dir" "$HOME/.config/$dir_name"
    fi
done

# ------------------------------------------------------------------------------
# Post-install
# ------------------------------------------------------------------------------
info "Running post-install tasks..."

# Install tmux plugins
if command -v tmux &>/dev/null && [ -f "$HOME/.tmux/plugins/tpm/bin/install_plugins" ]; then
    info "Installing tmux plugins..."
    "$HOME/.tmux/plugins/tpm/bin/install_plugins" || warn "Tmux plugin install had issues"
fi

# Setup fzf keybindings (if not already done)
if [ ! -f "$HOME/.fzf.zsh" ] && [ -f "$(brew --prefix)/opt/fzf/install" ]; then
    info "Setting up fzf..."
    "$(brew --prefix)/opt/fzf/install" --key-bindings --completion --no-update-rc
fi

echo ""
success "Installation complete!"
echo ""
info "Next steps:"
echo "  1. Restart your terminal or run: source ~/.zshrc"
echo "  2. In tmux, press prefix + I to install plugins"
echo "  3. Open nvim and run :Lazy sync"
echo ""
