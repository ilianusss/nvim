-- Language servers. nvim-lspconfig ships the default config of each server (command,
-- filetypes, root markers); mason-lspconfig enables every server Mason has installed.
-- Override a server's settings in after/lsp/<name>.lua; keymaps are in config/keymaps.lua.

return {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
        "saghen/blink.cmp", -- loads first so its completion capabilities reach every server
    },
    opts = {
        automatic_enable = {
            exclude = {
                "rust_analyzer", -- rustaceanvim starts its own rust-analyzer
                -- These tools have an LSP mode, but run here as formatter / linter instead
                "ruff", -- nvim-lint
                "stylua", -- conform
                "tflint", -- nvim-lint
            },
        },
    },
}
