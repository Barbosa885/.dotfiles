require("trouble").setup {
    position = "bottom",            -- Position of the list (options: bottom, top, left, right)
    height = 10,                    -- Height of the trouble list when in bottom/top position
    width = 50,                     -- Width of the list when in left/right position
    icons = true,                   -- Enable/disable icons
    mode = "document_diagnostics",  -- Mode options: workspace_diagnostics, document_diagnostics, quickfix, lsp_references, loclist
    fold_open = "",                -- Icon for open folds
    fold_closed = "",              -- Icon for closed folds
    group = true,                   -- Group results by file
    padding = true,                 -- Add extra padding at the top of the list
    action_keys = {                 -- Set key mappings for actions in trouble
        close = "q",                -- Close the list
        cancel = "<esc>",           -- Cancel preview and go back to previous window/buffer
        refresh = "r",              -- Refresh the list
        jump = {"<cr>", "<tab>"},   -- Jump to diagnostic or open file
        open_split = { "<c-x>" },   -- Open file in a split
        open_vsplit = { "<c-v>" },  -- Open file in a vertical split
        open_tab = { "<c-t>" },     -- Open file in a new tab
        toggle_mode = "m",          -- Toggle between "workspace" and "document" diagnostics mode
        toggle_preview = "P",       -- Toggle auto-preview
        hover = "K",                -- Show details for the diagnostic under the cursor
        preview = "p",              -- Preview the diagnostic location
        close_folds = {"zM", "zm"}, -- Close all folds
        open_folds = {"zR", "zr"},  -- Open all folds
        toggle_fold = {"zA", "za"}, -- Toggle fold under the cursor
        previous = "k",             -- Go to the previous item
        next = "j"                  -- Go to the next item
    },
    indent_lines = true,            -- Add indent guide lines
    auto_open = false,              -- Automatically open Trouble on diagnostics found
    auto_close = false,             -- Automatically close Trouble if no diagnostics
    auto_preview = true,            -- Auto-preview location of the diagnostic
    signs = {
        error = "",
        warning = "",
        hint = "",
        information = ""
    },
    use_diagnostic_signs = false    -- Use signs defined in your LSP client
}
