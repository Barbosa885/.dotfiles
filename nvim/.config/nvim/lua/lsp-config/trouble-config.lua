local M = {}

function M.setup()
  -- carrega o plugin e já define as opções
  require("trouble").setup({
    -- ao abrir, foca automaticamente na janela de Trouble?
    auto_open = false,
    auto_close = true,
    -- indent lines dentro da lista
    indent_lines = true,
    -- usa sinais do LSP (DiagnosticSignError, Warning etc) ou só texto?
    use_diagnostic_signs = true,
  })
end

return M
