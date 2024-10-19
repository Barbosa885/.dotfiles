-- LSP Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Quickfix function
  local function quickfix()
    vim.lsp.buf.code_action({
      filter = function(action)
        return action.isPreferred
      end,
      apply = true
    })
  end

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<leader>fo", vim.lsp.buf.formatting, bufopts)
  vim.keymap.set("n", "gl", ":lua vim.diagnostic.open_float({border = 'rounded'})<CR>", bufopts)
  vim.keymap.set("n", "<leader>qf", quickfix, bufopts)
end

local lsp_flags = {
  on_attach = on_attach,
  -- This is the default NVIM 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
require('lspconfig')['ts_ls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

require('lspconfig')['rust_analyzer'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  -- Server-specific settings...
  settings = {
    ["rust-analyzer"] = {}
  }
}


