-- Native LSP behaviour (no plugin required): diagnostics display and reference highlight.
-- Servers are installed by Mason (plugins/core/mason.lua) and started by mason-lspconfig
-- (plugins/core/lspconfig.lua). Per-server settings go in after/lsp/<server>.lua.
-- LSP keymaps are in config/keymaps.lua.

vim.diagnostic.config({
    signs = {
        numhl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
            [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
            [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
            [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
        },
        text = {
            [vim.diagnostic.severity.ERROR] = "X",
            [vim.diagnostic.severity.HINT] = "?",
            [vim.diagnostic.severity.INFO] = "I",
            [vim.diagnostic.severity.WARN] = "!",
        },
    },
    update_in_insert = true,
    virtual_text = false,
    virtual_lines = { current_line = true },
})

local highlight_group = vim.api.nvim_create_augroup("user_lsp_highlight", { clear = true })

-- Highlight other references of the symbol under the cursor
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client:supports_method("textDocument/documentHighlight", ev.buf) then
            vim.api.nvim_clear_autocmds({ group = highlight_group, buffer = ev.buf })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = ev.buf,
                group = highlight_group,
                callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = ev.buf,
                group = highlight_group,
                callback = vim.lsp.buf.clear_references,
            })
        end
    end,
})

vim.api.nvim_create_autocmd("LspDetach", {
    group = vim.api.nvim_create_augroup("user_lsp_detach", { clear = true }),
    callback = function(ev)
        vim.lsp.buf.clear_references()
        vim.api.nvim_clear_autocmds({ group = highlight_group, buffer = ev.buf })
    end,
})
