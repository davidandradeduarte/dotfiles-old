# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/david/.oh-my-zsh"

ZSH_THEME="ys"

plugins=(
    git
    golang
    python
    dotnet
    vagrant
    colored-man-pages
    colorize
    brew
    osx
    zsh-syntax-highlighting
    zsh-completions
    zsh-autosuggestions
    )

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
export PATH="/usr/local/sbin:$PATH" # not added by default 

# batcat -> bat (ubuntu only)
# alias batcat="bat"

export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY

# fzf options
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 90% --layout=reverse'

# fzf keybindinds for ubuntu
# source /usr/share/doc/fzf/examples/key-bindings.zsh
# source /usr/share/doc/fzf/examples/completion.zsh

# homebrew ubuntu
# echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/david/.profile
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# export PATH="/home/linuxbrew/.linuxbrew/bin/:$PATH"

export PATH="/usr/local/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/usr/local/opt/openjdk/include"

# Add GOPATH/bin to PATH
export PATH="$PATH:$(go env GOPATH)/bin"

# lazygit
lg(){
    lazygit "$@"
}

# kubectl
k(){
    kubectl "$@"
}

# kubectx
kc(){
    kubectx "$@"
}

# kubens
kn(){
    kubens "$@"
}

# z
. /usr/local/etc/profile.d/z.sh

# f*
eval $(thefuck --alias)
