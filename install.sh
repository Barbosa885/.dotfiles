# install nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon

# source nix 
~/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA \
	nixpkgs.zsh \
	nixpkgs.antibody \
	nixpkgs.neovim \
	nixpkgs.gcc \
	nixpkgs.yarn \
	nixpkgs.bat \
	nixpkgs.tmux \
	nixpkgs.stow \
	nixpkgs.git 

# stow files
stow zsh
stow tmux
stow git 
stow nvim
stow p10k

# add zsh to valid login shells
command -v zsh | sudo tee /etc/shells

# use zsh as my default shell
sudo chsh -s $(which zsh) $USER

# bundle zsh plugins
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# install plugins
nvim --headless +PackerCompile +PackerUpdate +qa
