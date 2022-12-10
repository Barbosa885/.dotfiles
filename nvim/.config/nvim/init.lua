-- General settings
require("settings")

-- Keymaps
require("mappings")

-- Packer Plugin manager
require("packer-config")

-- Colorschemes, Themes
require("colorscheme-config.tokyonight")
require("colorscheme-config.lualine")
require("colorscheme-config.onedark")
require("colorscheme-config.neoscroll")
require("colorscheme-config.kanagawa")

-- Nvim Tree
require("nvim-tree-config")

-- Lsp
require("lsp-config.nvim-cmp")
require("lsp-config.lsp-installer")
require("lsp-config.autopairs")
require("lsp-config.lsp-cfg")

-- Treesitter
require("ts-config")

-- Telescope
require("telescope-config")
