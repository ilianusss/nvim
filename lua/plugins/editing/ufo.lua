-- nvim-ufo: modern code folding (LSP folding ranges, falls back to indentation)

return {
    "kevinhwang91/nvim-ufo",
    event = "BufReadPost",
    dependencies = { "kevinhwang91/promise-async" },
    init = function()
        vim.o.foldcolumn = "1" -- show a one-character fold column
        vim.o.foldlevel = 99 -- start with all folds open (ufo needs a large foldlevel)
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true
    end,
    opts = {
        provider_selector = function(bufnr)
            for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
                if client.server_capabilities.foldingRangeProvider then
                    return { "lsp", "indent" }
                end
            end
            return { "indent" }
        end,
    },
}
