#!/bin/bash

echo "Starting setup"

# install homebrew

if test ! $(which brew); then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Updating homebrew"
brew update

# not using homebrew yet. prefer apt when possible
# echo "Installing homebrew packages..."
# brew_packages=(
#     git
#     neovim
#     bat
#     fzf
# )
# brew install ${brew_packages[@]}

# echo "Installing homebrew casks..."
# brew_casks=(
#     visual-studio-code
# )
# brew install --cask ${brew_casks[@]}

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install git
sudo apt-get install zsh
sudo chsh -s $(which zsh)
echo $SHELL
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
