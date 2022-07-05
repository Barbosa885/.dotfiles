# install nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon

# source nix 
. ~/.nix-profile/etc/profile.d/nix.sh

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

# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

# use zsh as my default shell
chsh -s $(which zsh) $USER

# load zsh
exec zsh

# bundle zsh plugins
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
	~/.local/share/nvim/site/pack/packer/start/packer.nvim

# install plugins
nvim --headless +PackerSync +qa 
