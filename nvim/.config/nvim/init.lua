-- General settings
require("settings")

-- Keymaps
require("mappings")

-- Packer Plugin manager
require("packer-config")

-- Lsp
require("lsp-config/nvim-cmp")
require("lsp-config/lsp-signature")
require("lsp-config/lsp-installer")
require("lsp-config/lsp-cfg")
require("lsp-config.trouble-config")

-- Treesitter
require("ts-config")

-- Telescope
require("telescope-config")

-- Nvim Tree
require("nvim-tree-config")

-- Snippets
require("luasnip.loaders.from_lua").lazy_load({ paths = {"~/.config/nvim/lua/snippets"}})

--Rocq
require("rocq")
