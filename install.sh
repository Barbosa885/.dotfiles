#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Detect OS and distribution
detect_os() {
  if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
  else
    echo "❌ Cannot detect the OS. Exiting."
    exit 1
  fi
}

# Perform system update based on distribution
system_update() {
  case "$OS" in
    arch)
      echo "🔄 Updating system (Arch)..."
      sudo pacman -Syu --noconfirm
      ;;
    debian|ubuntu)
      echo "🔄 Updating system (Debian-based)..."
      sudo apt-get update -y && sudo apt-get upgrade -y
      ;;
    fedora)
      echo "🔄 Updating system (Fedora)..."
      sudo dnf upgrade -y
      ;;
    *)
      echo "❌ Unsupported distribution: $OS. Exiting."
      exit 1
      ;;
  esac
}

# Install Nix
install_nix() {
  if ! command -v nix &> /dev/null; then
    echo "🚀 Installing Nix..."
    sh <(curl -L https://nixos.org/nix/install) --no-daemon
    . ~/.nix-profile/etc/profile.d/nix.sh
  else
    echo "✔️  Nix is already installed."
  fi
}

# Install packages using Nix
install_packages() {
  packages=(
    zsh
    antibody
    neovim
    gcc
    yarn
    bat
    tmux
    stow
    git
    kitty
  )

  echo "🚀 Installing packages with Nix..."
  for package in "${packages[@]}"; do
    echo "📦 Installing $package..."
    nix-env -iA nixpkgs.$package
  done
}

# Stow dotfiles
stow_files() {
  stow_dirs=(
    zsh
    tmux
    git
    nvim
    p10k
    i3
    polybar
    rofi
    dunst
    picom
    kitty
    zathura
    waybar
    wofi
    swaylock
  )

  echo "🔗 Creating symlinks with Stow..."
  for dirs in "${stow_dirs[@]}"; do
    echo "➦ Stowing $dirs..."
    stow $dirs
  done
}

# Configure Zsh as default shell
set_default_shell() {
  if [ "$SHELL" != "$(command -v zsh)" ]; then
    echo "🚀 Setting Zsh as default shell..."
    command -v zsh | sudo tee -a /etc/shells
    chsh -s "$(which zsh)" "$USER"
  else
    echo "✔️  Zsh is already the default shell."
  fi
}

# Bundle Zsh plugins using Antibody
bundle_antibody_plugins() {
  if [ -f ~/.zsh_plugins.txt ]; then
    echo "🎁 Bundling Antibody plugins..."
    antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
  else
    echo "❌ Antibody plugins file not found."
  fi
}

# Install Packer for Neovim
install_packer() {
  packer_dir="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
  if [ ! -d "$packer_dir" ]; then
    echo "🚀 Installing Packer for Neovim..."
    git clone --depth 1 https://github.com/wbthomason/packer.nvim "$packer_dir"
  else
    echo "✔️  Packer is already installed."
  fi
}

# Sync Neovim plugins
sync_nvim_plugins() {
  echo "🔨 Syncing Neovim plugins..."
  nvim --headless +PackerSync +qa
}

# Main script execution
main() {
  detect_os
  system_update
  install_nix
  install_packages
  stow_files
  set_default_shell
  bundle_antibody_plugins
  install_packer
  sync_nvim_plugins

  echo "⚙️  Executing Zsh..."
  exec zsh
}

# Run the main function
main
