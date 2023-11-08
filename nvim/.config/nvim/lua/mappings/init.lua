local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fs", ":Telescope grep_string<CR>", opts)
map("n", "<leader>fk", ":Telescope keymaps<CR>", opts)
map("n", "<leader>fc", ":Telescope colorscheme<CR>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
map("n", "<leader>fd", "<CMD>lua require'telescope-config'.find_dotfiles()<CR>", opts)

-- Navigation
map("n", "<A-h>", ":NavigatorLeft<CR>", opts)
map("n", "<A-l>", ":NavigatorRight<CR>", opts)
map("n", "<A-k>", ":NavigatorUp<CR>", opts)
map("n", "<A-j>", ":NavigatorDown<CR>", opts)
map("n", "<A-p>", ":NavigatorPrevious<CR>", opts)

-- Others
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>md", ":MarkdownPreview<CR>", opts)

