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

sudo apt install neovim
sudo apt install bat
sudo apt-get install fzf
sudo apt-get install tldr
sudo apt-get install jq
sudo apt-get install ncdu
sudo apt-get install tmux
#sudo apt-get install thefuck
# thefuck
sudo apt update
sudo apt install python3-dev python3-pip python3-setuptools
sudo pip3 install thefuck
#
# kubectl
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
#
# azurec-li
sudo apt-get update
sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg
curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt/sources.list.d/azure-cli.list
sudo apt-get update
sudo apt-get install azure-cli
#
sudo apt-get install ack-grep
# ansible
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible
#
brew install stern
brew install kubectx
# go https://github.com/golang/go/wiki/Ubuntu
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update
sudo apt install golang-go
#
# terraform
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform
#
brew install k3d
brew install ctop
sudo apt-get install kafkacat
