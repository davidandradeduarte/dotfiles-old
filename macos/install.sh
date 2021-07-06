#!/bin/bash

echo "Starting setup"

# install xcode CLI
xcode-select --install

if test ! $(which brew); then
	echo "Installing homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Updating homebrew..."
brew update

echo "Installing homebrew packages..."
brew_packages=(
	git
	neovim
	bat
	fzf
	wget
	grep
	htop
	tldr
	jq
	ncdu
	tmux
	bash
	zsh
	# zsh-autosuggestions
	# zsh-you-should-use
	# zsh-completions
	# zsh-syntax-highlighting
	thefuck
	kubernetes-cli
	azure-cli
	ack
	ansible
	vagrant-completion
	stern
	kubectx
	gh
	go
	vim
	curl
	terraform
	minikube # runs on a vm
	k3d
	kind # consider removing all the other k8s wrappers since kind seems to be the best option
	ubuntu/microk8s/microk8s
	nmap
	tree
	rust
	watch
	fish
	ripgrep
	findutils
	yq
	gawk
	nano
	openssh
	fd
	make
	openvpn
	mkcert
	k9s
	bash-completion
	archey
	python
	ctop
	mas
	java
	wireshark
	aircrack-ng
	john
	iproute2mac
	# teleconsole # deprecated
	git-delta
	php
	ranger
	kafkacat
	http-server
	speedtest-cli
	pre-commit
	gitversion
	kustomize
	sops
	fluxctl
	fluxcd/tap/flux
	tflint
	terragrunt
	wakeonlan
	mycli
	mysql
	mongocli
	rustscan
	z
	evans
	mongodb-community
	terraform-docs
	bandwhich
	Azure/kubelogin/kubelogin
	hugo
	stress
	wiki
	golangci-lint
	ffmpeg
	opus
	opus-tools
	krew
	kotlin
	ruby
	git-chglog
	multitail
	derailed/popeye/popeye
	grpcurl
	yarn
	yarn-completion
	gibo
	typescript
	helm
	maven
	youtube-dl
	emacs
	httpstat
	tcpstat
	# dep # deprecated
	benthos
	sqlc
	autopep8
	black
	yapf
	mono
	terminal-notifier
)
brew tap mongodb/brew
brew tap ktr0731/evans
brew tap git-chglog/git-chglog
brew tap isen-ng/dotnet-sdk-versions # https://github.com/isen-ng/homebrew-dotnet-sdk-versions
brew install ${brew_packages[@]}

# dotnet version management
# https://github.com/isen-ng/homebrew-dotnet-sdk-versions
brew tap isen-ng/dotnet-sdk-versions

# oh-my-posh
# update this doc with https://ohmyposh.dev/docs/installation/

echo "Installing homebrew casks..."
brew_casks=(
	visual-studio-code
	iterm2
	brave-browser
	google-chrome
	firefox
	tor-browser
	zoom
	slack
	microsoft-teams
	docker
	obs
	bitwarden
	lens
	discord
	vagrant
	dotnet-sdk
	openvpn-connect
	#intellij-idea-ce
	intellij-idea
	rider
	jetbrains-toolbox
	powershell
	kitty
	hyper
	alacritty
	thunderbird
	cloudflare-warp
	protonvpn
	spotify
	maccy
	rectangle
	whatsapp
	messenger
	notion
	gimp
	fork
	stats
	scroll-reverser
	vlc
	disk-inventory-x
	angry-ip-scanner
	libre-office
	virtualbox
	microsoft-remote-desktop
	opensong
	wireshark
	wireshark-chmodbpf
	transmission
	ngrok
	goland
	#itsycal
	meetingbar
	azure-data-studio
	vnc-viewer
	signal
	mongodb-compass
	gns3
	microsoft-azure-storage-explorer
	multipass
	postman
	twitch
	microsoft-edge
	container-ps
	kindle
	steam
	battle-net
	github
	amazon-music
	epic-games
	android-file-transfer
	raspberry-pi-imager
	wombat
	bloomrpc
)
brew install --cask ${brew_casks[@]}

echo "Cleaning up homebrew..."
brew upgrade
brew cleanup
brew doctor

# TODO: install code extensions
# code --install-extension X

# app store
mas install 937984704 # Amphetamine
mas install 409789998 # Twitter TODO: outdated. points to an old app version

# go packages
go get -u github.com/hakluke/hakrawler
go get -u github.com/oligot/go-mod-upgrade
go get -u github.com/rakyll/gotest
go get -u github.com/cucumber/godog/cmd/godog

# gem
sudo gem install mdless

# dotnet packages
dotnet tool install -g dotnet-format

# npm packages
npm install -g azurite
npm i -g krane # krane cli

# kubectl plugins
kubectl krew install view-secret

# python packages
#pip3 install scrapy
pip3 install terraplanfeed
pip3 install statcode

# sdk man
curl -s "https://get.sdkman.io" | bash

# TODO: Change OSX defaults
# - show all file extensions
# - hide dock
# - Trackpad options
# - tap to click
# - swipe down with 3 fingers
# - 
# - ...
# remove all items from dock
defaults delete com.apple.dock persistent-apps; killall Dock
# only open apps in dock
defaults write com.apple.dock static-only -bool true
# set computer name
sudo scutil --set ComputerName "lion"
sudo scutil --set HostName "lion"
sudo scutil --set LocalHostName "lion"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "lion"
# disable the sound effects on boot
sudo nvram SystemAudioVolume=" "
# trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
# stop recent apps from being in dock
defaults write com.apple.dock show-recents -bool no
defaults write com.apple.dock recent-apps -array # intentionally empty
# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true
# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Finder: hide status bar
defaults write com.apple.finder ShowStatusBar -bool false
# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true
# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true
# Show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"
# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0
# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4
# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
# Finder to list view
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# rm all .DS_Store files
sudo find / -name ".DS_Store" -exec rm {} \;


# Use a modified version of the Solarized Dark theme by default in Terminal.app
# TODO: Not working
osascript <<EOD
tell application "Terminal"
	set themeName to "Homebrew" 
end tell
EOD

# TODO: dotfiles
# - gitconfig
# - gitignore
# - vimrc
# - ...

echo "Setup completed!"
