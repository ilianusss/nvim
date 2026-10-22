-- Merged on top of nvim-lspconfig's defaults for gopls
return {
    settings = {
        gopls = {
            analyses = { unusedparams = true },
            staticcheck = true,
        },
    },
}
