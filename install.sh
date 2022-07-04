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

# install packer 
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# install plugins
nvim --headless +PackerSync +qa 

# github cli
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg

sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

sudo apt install gh

# log into github with gh
gh auth login
