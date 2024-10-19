return require('packer').startup(function()

  --Tpope
  use "tpope/vim-commentary"
  use "tpope/vim-surround"
  use "tpope/vim-fugitive"

  --Themes
  use "folke/tokyonight.nvim"
  use "navarasu/onedark.nvim"
  use "rebelot/kanagawa.nvim"
  use {"mcchrish/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    requires = "rktjmp/lush.nvim"
  }

  --Nvim tree
  use "kyazdani42/nvim-tree.lua" --tree
  use "kyazdani42/nvim-web-devicons" --icons 
  use { "numToStr/Navigator.nvim",
    config = function()
        require('Navigator').setup()
    end
  }

  --Lsp Plugins
  use "hrsh7th/nvim-cmp" -- Autocompletion plugin
  use "hrsh7th/cmp-nvim-lsp" -- LSP source for nvim-cmp
  use "hrsh7th/vim-vsnip" -- Snippets plugin
  use "saadparwaiz1/cmp_luasnip" -- Snippets source for nvim-cmp
  use "prisma/vim-prisma" -- Prisma syntax
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim", -- Mason LSP
    "neovim/nvim-lspconfig"
  } -- New Lsp plugin
  

  --Autopairs
  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag" -- Autotag plugin

  --Telescope Plugins
  use "nvim-telescope/telescope.nvim"
  use "nvim-lua/plenary.nvim"

  --Others
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", }
  use { "iamcco/markdown-preview.nvim", run = "cd app && yarn install", cmd = "MarkdownPreview" }
  use "github/copilot.vim"
  use "nvim-lualine/lualine.nvim"
  use "wbthomason/packer.nvim" 
  use "folke/trouble.nvim"
  use "christoomey/vim-tmux-navigator"
  use "karb94/neoscroll.nvim"
  use "lervag/vimtex"

end)
