#!/bin/bash

# Detect the system and distribution
detect_os() {
  if [ -f /etc/os-release ]; then
    . /etc/os-release
        # Treat EndeavourOS and other Arch-based distributions as Arch
    if [[ "$ID" == "arch" || "$ID" == "endeavouros" || "$ID_LIKE" == "arch" ]]; then
      OS="arch"
        echo "✅ Detected OS: $OS"
    else
      OS=$ID
      echo "✅ Detected OS: $OS"
    fi
  else
    echo "❌ Cannot detect the OS. Exiting."
    exit 1
  fi
}

# Perform system update based on distribution
system_update() {
  echo "🔄 Performing system update for $OS..."
  case "$OS" in
    arch)
      sudo pacman -Syu --noconfirm
      ;;
    debian|ubuntu)
      sudo apt-get update -y && sudo apt-get upgrade -y
      ;;
    fedora)
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
  echo "🚀 Installing Nix..."
  if ! command -v nix &> /dev/null; then
    sh <(curl -L https://nixos.org/nix/install) --no-daemon
    . ~/.nix-profile/etc/profile.d/nix.sh
  else
    echo "✔️ Nix is already installed."
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

# Stow dotfiles to .config or home
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
  for dir in "${stow_dirs[@]}"; do
	  stow "$dir"
    echo "➦ Symlinks created for $dir"
  done
}

# Set Zsh as the default shell
set_default_shell() {
  echo "🚀 Configuring Zsh as the default shell..."
  if [ "$SHELL" != "$(command -v zsh)" ]; then
    command -v zsh | sudo tee -a /etc/shells
    chsh -s "$(which zsh)" "$USER"
  else
    echo "✔️  Zsh is already the default shell."
  fi
}

# Bundle Zsh plugins using Antibody
bundle_antibody_plugins() {
  echo "🎁 Bundling Zsh plugins with Antibody..."
  if [ -f ~/.zsh_plugins.txt ]; then
    antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
  else
    echo "❌ Antibody plugins file not found: ~/.zsh_plugins.txt"
  fi
}

# Install Packer for Neovim
install_packer() {
  echo "🚀 Installing Packer for Neovim..."
  packer_dir="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
  if [ ! -d "$packer_dir" ]; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim "$packer_dir"
  else
    echo "✔️  Packer is already installed."
  fi
}

# Sync Neovim plugins
sync_nvim_plugins() {
  echo "🔨 Installing Neovim plugins..."
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
