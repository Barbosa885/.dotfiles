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


local keymap = vim.keymap.set
-- LSP Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
keymap('n', '[d', vim.diagnostic.goto_prev, opts)
keymap('n', ']d', vim.diagnostic.goto_next, opts)
keymap('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  keymap("n", "gD", vim.lsp.buf.declaration, bufopts)
  keymap("n", "gd", vim.lsp.buf.definition, bufopts)
  keymap("n", "K", vim.lsp.buf.hover, bufopts)
  keymap("n", "gi", vim.lsp.buf.implementation, bufopts)
  keymap("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  keymap("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
  keymap("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  keymap("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  keymap("n", "gr", vim.lsp.buf.references, bufopts)
  keymap("n", "<leader>fo", vim.lsp.buf.formatting, bufopts)
  keymap(
    "n",
    "gl",
    "<cmd>lua vim.diagnostic.open_float({border = 'rounded'})<CR>",
    bufopts
  )
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
require('lspconfig')['sumneko_lua'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
