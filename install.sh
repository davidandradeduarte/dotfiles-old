#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim/nvim
ln -s ${BASEDIR}/common/.vimrc ~/.vimrc
ln -s ${BASEDIR}/common/init.vim ~/.config/nvim/init.vim

# bash/zsh
ln -s ${BASEDIR}/common/.zshrc ~/.zshrc
ln -s ${BASEDIR}/common/.env ~/.zshrc

# git
ln -s ${BASEDIR}/common/.gitconfig ~/.gitconfig
ln -s ${BASEDIR}/common/.gitignore ~/.gitconfig
ln -s ${BASEDIR}/common/gitconfig ~/.gitconfig

# vscode (macos only)
ln -s ${BASEDIR}/common/vscode/keybindings.json ~/Library/Application Support/Code/User/keybindings.json
ln -s ${BASEDIR}/common/vscode/settings.json ~/Library/Application Support/Code/User/settings.json

### WIP