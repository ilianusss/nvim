-- rustaceanvim: Rust IDE features on top of rust-analyzer (runnables, macro expansion,
-- clippy checks). It starts rust-analyzer itself, which is why mason-lspconfig excludes it
-- (plugins/core/lspconfig.lua).

return {
    "mrcjkb/rustaceanvim",
    version = "^9",
    lazy = false, -- the plugin lazy-loads itself on Rust files
    init = function()
        vim.g.rustaceanvim = {
            server = {
                default_settings = {
                    ["rust-analyzer"] = {
                        cargo = { allFeatures = true },
                        check = { command = "clippy" },
                    },
                },
            },
        }
    end,
}
