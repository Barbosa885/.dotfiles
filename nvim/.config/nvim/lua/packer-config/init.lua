return require('packer').startup(function()

  --Lsp Plugins
  use { "mason-org/mason.nvim" } -- Gerenciador de LSPs, linters, etc.
  use { "mason-org/mason-lspconfig.nvim" }
  use { "neovim/nvim-lspconfig" } -- Configuração básica de LSP
  use { "hrsh7th/nvim-cmp" } -- Motor de autocompletar
  use { "hrsh7th/cmp-nvim-lsp" } -- Fonte de autocompletar LSP
  use { "saadparwaiz1/cmp_luasnip" } -- Integração do cmp com LuaSnip
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("lsp-config.trouble-config").setup()
    end
  }
  use { "ray-x/lsp_signature.nvim" } -- Assinatura de funções

  --Tpope
  use "tpope/vim-commentary"
  use "tpope/vim-surround"
  use "tpope/vim-fugitive"

  --Telescope Plugins
  use "nvim-telescope/telescope.nvim"
  use "nvim-lua/plenary.nvim"

  --Others
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", }
  use "nvim-lualine/lualine.nvim"
  use "wbthomason/packer.nvim" 
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
  use({
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!:).
    run = "make install_jsregexp"
  }) -- Snippets
  use "aurum77/live-server.nvim"
  use { 
    'whonore/Coqtail',
    ft = 'coq'
  }

  --Nvim tree
  use "nvim-tree/nvim-web-devicons" --icons 
  use "christoomey/vim-tmux-navigator"
  use "nvim-tree/nvim-tree.lua" --tree
  use "nvimdev/dashboard-nvim"

  --Themes
  use {"morhetz/gruvbox", config = function() vim.cmd.colorscheme("gruvbox") end }
  use {"folke/tokyonight.nvim", config = function() vim.cmd.colorscheme("tokyonight") end }
  use {"sainnhe/sonokai", config = function() vim.cmd.colorscheme("sonokai") end }
  use {"sainnhe/everforest", config = function() vim.cmd.colorscheme("everforest") end }
  use {"navarasu/onedark.nvim", config = function() vim.cmd.colorscheme("onedark") end }
  use {"catppuccin/nvim", as = "catppuccin", config = function() vim.cmd.colorscheme("catppuccin") end }
  use {
    "zenbones-theme/zenbones.nvim", config = function() vim.cmd.colorscheme("zenbones") end,
    lazy = false,
    requires = { "rktjmp/lush.nvim" },
  }
  use {
    "rebelot/kanagawa.nvim", config = function() vim.cmd.colorscheme("kanagawa") end,
    priority = 1000
  }

end)
