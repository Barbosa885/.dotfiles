# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -Uz compinit && compinit

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
alias gpull="git pull"
#============================================================
# Commit messages with cody
ccm() {
  git diff . | cody chat --stdin -m 'Write a simple and objective commit message for this diff using conventional commit patterns'
}
#============================================================

# Network Manager

# no password
alias cwifi="nmcli device wifi connect $1"

# with password
password_wifi() {
  name=$1
  password=$2
  nmcli device wifi connect "$name" password "$password"
}
alias cpwifi=password_wifi

# List wifi
alias lwifi="nmcli device wifi list"
#============================================================
double_monitor() {
  # Detectar os nomes dos monitores conectados
  primary_monitor=$(xrandr | grep "connected primary" | cut -d ' ' -f1)
  secondary_monitor=$(xrandr | grep "connected" | grep -v " primary" | cut -d ' ' -f1)

  if [ -z "$primary_monitor" ] || [ -z "$secondary_monitor" ]; then
    echo "Monitores não detectados corretamente. Certifique-se de que ambos os monitores estão conectados."
    return 1
  fi

    # Verificar se a posição foi fornecida como argumento
    position="$1"
    if [ -z "$position" ]; then
      position="--same-as"
    fi

    # Configurar o espelhamento ou a posição relativa
    xrandr --output "$secondary_monitor" $position "$primary_monitor" --auto
    echo "Monitores configurados: $primary_monitor $position $secondary_monitor"
}

single_monitor() {
  # Detectar todos os monitores conectados
  monitors=($(xrandr | grep " connected" | cut -d ' ' -f1))
  
  if [ ${#monitors[@]} -eq 0 ]; then
    echo "Nenhum monitor detectado. Certifique-se de que o monitor está conectado."
    return 1
  fi

  # Verificar se o monitor primário foi fornecido como argumento
  selected_primary="$1"
  if [ -z "$selected_primary" ]; then
    selected_primary=$(xrandr | grep "connected primary" | cut -d ' ' -f1)
    if [ -z "$selected_primary" ]; then
      selected_primary="${monitors[0]}"
    fi
  fi

  # Desativar todos os outros monitores
  for monitor in "${monitors[@]}"; do
    if [ "$monitor" != "$selected_primary" ]; then
      xrandr --output "$monitor" --off
    fi
  done

  # Ativar apenas o monitor primário
  xrandr --output "$selected_primary" --primary --auto 
  echo "Monitor configurado: $selected_primary"
}

alias dmon=double_monitor
alias smon=single_monitor

#============================================================
# CLIPBOARD
alias clip="clip.exe"

#============================================================
# Restart NetworkManager
alias rmn="sudo systemctl restart NetworkManager"

#============================================================
# Python environment
alias pyenv="source ~/myvenv/bin/activate"

# Yazi change dir
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


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
export PATH=$PATH:/home/barbosa/.dotnet/tools

# Adds ruby gems to PATH
export GEM_HOME="$HOME/.gem"
export GEM_PATH="$HOME/.gem"

# Adds asdf to PATH
# . /opt/asdf-vm/asdf.sh
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# append completions to fpath
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)

# Adds texlive to PATH
export PATH=$PATH:/usr/local/texlive/2020/bin/x86_64-linux

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export LANG=pt_BR.UTF-8
export LC_CTYPE=pt_BR.UTF-8

export FONTCONFIG_PATH=/etc/fonts

# Define o arquivo de histórico
HISTFILE=~/.zsh_history

# Define o tamanho máximo do histórico no arquivo e no terminal
HISTSIZE=10000
SAVEHIST=10000

# Salva comandos únicos para evitar duplicatas no histórico
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS

# Adiciona comandos ao histórico imediatamente
setopt INC_APPEND_HISTORY

# Compartilha o histórico entre diferentes sessões do terminal
setopt SHARE_HISTORY
export GEMINI_API_KEY="AIzaSyCW9blXnXajx62jI7rcwVeNSEaA8SrY8AI"


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/home/barbosa/.opam/opam-init/init.zsh' ]] || source '/home/barbosa/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration
