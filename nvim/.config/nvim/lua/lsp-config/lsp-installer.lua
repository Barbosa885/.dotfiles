require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "pyright", "ts_ls" } -- Add your preferred language servers here
})

local lspconfig = require("lspconfig")
require("mason-lspconfig").setup_handlers({
    function(server)
        lspconfig[server].setup {
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
            on_attach = function(client, bufnr)
                local bufopts = { noremap=true, silent=true, buffer=bufnr }
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                -- Add more keymaps for LSP features as needed
            end,
        }
    end,
})
