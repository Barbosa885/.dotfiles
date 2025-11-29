-- Keymaps para Coqtail
vim.g.coqtail_noimap = 1  -- Desabilita insert mode maps padrão se quiser

-- Keymaps customizados (exemplos)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "coq",
  callback = function()
    local opts = { noremap=true, silent=true, buffer=true }
    -- Avançar prova
    vim.keymap.set('n', '<leader>j', ':CoqNext<CR>', opts)
    -- Voltar na prova
    vim.keymap.set('n', '<leader>k', ':CoqUndo<CR>', opts)
    -- Ir até o cursor
    vim.keymap.set('n', '<leader>l', ':CoqToLine<CR>', opts)
    -- Restart Coq
    vim.keymap.set('n', '<leader>cr', ':CoqRestart<CR>', opts)
  end
})
