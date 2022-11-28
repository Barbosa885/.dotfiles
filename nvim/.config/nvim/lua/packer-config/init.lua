return require('packer').startup(function()

  --Tpope
  use "tpope/vim-commentary"
  use "tpope/vim-surround"
  use "tpope/vim-fugitive"

  --Themes
  use "folke/tokyonight.nvim"
  use "navarasu/onedark.nvim"

  --Nvim tree
  use "kyazdani42/nvim-tree.lua" --tree
  use "kyazdani42/nvim-web-devicons" --icons 
  use { "numToStr/Navigator.nvim",
    config = function()
        require('Navigator').setup()
    end
  }

  --Lsp Plugins
  use "neovim/nvim-lspconfig" -- Lsp
  use "williamboman/nvim-lsp-installer" -- Lsp installer
  use "hrsh7th/nvim-cmp" -- Autocompletion plugin
  use "hrsh7th/cmp-nvim-lsp" -- LSP source for nvim-cmp
  use "saadparwaiz1/cmp_luasnip" -- Snippets source for nvim-cmp
  use "L3MON4D3/LuaSnip" -- Snippets plugin
  use "nvim-lua/completion-nvim" -- Autocompletion plugin
  use "jose-elias-alvarez/null-ls.nvim" -- LSP configuration for null-ls

  --Autopairs
  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag" -- Autotag plugin

  --Telescope Plugins
  use "nvim-telescope/telescope.nvim"
  use "nvim-lua/plenary.nvim"

  --Others
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", }
  use "github/copilot.vim"
  use "nvim-lualine/lualine.nvim"
  use "wbthomason/packer.nvim" 
  use "folke/trouble.nvim"
  use "iamcco/markdown-preview.nvim"
  use "christoomey/vim-tmux-navigator"
  use "karb94/neoscroll.nvim"

end)
