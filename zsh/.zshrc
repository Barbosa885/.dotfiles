# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -Uz compinit
compinit

# source plugins
source ~/.zsh_plugins.sh

# aliases
alias v="nvim"
#============================================================
alias master="cd /mnt/c/Users/gusta/Documents/projects/master-front"
#============================================================
alias HOME="cd /mnt/c/Users/gusta"
#============================================================
alias projects="cd /mnt/c/Users/gusta/Documents/projects"
#============================================================
alias t="tmux"
#============================================================

# TMUX
alias ide="f(){
  tmux | " . ~/ide.sh"
};f"
#============================================================

# Config Files
alias zconf="f(){v "~/.zshrc"};f"
#============================================================
alias wconf="f()(v "/mnt/c/Users/gusta/.config/wezterm/wezterm.lua");f"
#============================================================

# GIT
alias pull="git pull"
#============================================================
gadd() {
  git add $1 
  if [ -n "$2" ]
  then
    git commit -m "$2"
  else 
    git commit -m update
  fi 
    git push
}
#============================================================

# CLIPBOARD
alias clip="clip.exe"

# Use nix
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi 

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/p10k/.p10k.zsh.
[[ ! -f ~/.dotfiles/p10k/.p10k.zsh ]] || source ~/.dotfiles/p10k/.p10k.zsh

# Add .local bin to path
export PATH=$PATH:$HOME/.local/bin
# Set java home
JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64 
export JAVA_HOME

# Android SDK
export ANDROID_HOME=$HOME/Android/Sdk

# Flutter
export PATH=$HOME/Applications/flutter/bin:$PATH

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
# Start Docker daemon automatically when logging in if not running.
RUNNING=`ps aux | grep dockerd | grep -v grep`
if [ -z "$RUNNING" ]; then
    sudo dockerd > /dev/null 2>&1 &
    disown
fi

# Add dotnet to PATH
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet

# Adds ruby gems to PATH
export GEM_HOME="$HOME/.gem"
export GEM_PATH="$HOME/.gem"

. /opt/asdf-vm/asdf.sh
