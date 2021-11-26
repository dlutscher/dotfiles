#!/bin/zsh

echo "Updating homebrew/linuxbrew..."
brew update

# install all packages specified in the Brewfile
brew bundle install


# Enhanced directory navigation
echo "Installing enhanced navigation utilities"
if [ ! -d "$HOME/utils/enhancd" ]; then
  git clone https://github.com/b4b4r07/enhancd.git  $HOME/utils/enhancd
fi

# Installing ohmyzsh and plugins
echo "Installing ohmyzsh"

# installs autosuggestions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


# install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


# we need ruby for tmuxinator
if ! command -v gem &> /dev/null; then
  brew install ruby
fi

# tool for pre-configuring tmux sessions
if ! command -v tmuxinator &> /dev/null; then
  gem install tmuxinator
fi

# Ctags. (Used by Neovim)
if ! command -v ctags &> /dev/null; then
  brew install --HEAD universal-ctags/universal-ctags/universal-ctags
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi


# Install dotfiles
echo "Making a backup of your dotfiles ----> $HOME/dotfiles_OLD"
mkdir -p $HOME/dotfiles_OLD

mv -af $HOME/.zshrc $HOME/.secrets $HOME/dotfiles_OLD/ 2>/dev/null
mv -af $HOME/.exports $HOME/.aliases $HOME/dotfiles_OLD/ 2>/dev/null
mv -af $HOME/.tmux.conf $HOME/dotfiles_OLD/ 2>/dev/null

echo "Creating symlinks"
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

ln -nvfs $DOTFILES_DIR/zshrc           $HOME/.zshrc
ln -nvfs $DOTFILES_DIR/tmux.conf       $HOME/.tmux.conf
ln -nvfs $DOTFILES_DIR/exports         $HOME/.exports
ln -nvfs $DOTFILES_DIR/aliases         $HOME/.aliases
ln -nvfs $DOTFILES_DIR/bin             $HOME/bin
ln -nvfs $DOTFILES_DIR/secrets         $HOME/.secrets


# copies config folder (mostly neovim stuff) into home directory
find config -mindepth 1 -maxdepth 1 | while read dir; do
ln -nvfs $DOTFILES_DIR/$dir $HOME/.$dir
done
