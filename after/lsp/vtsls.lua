-- Merged on top of nvim-lspconfig's defaults for vtsls (TypeScript / JavaScript)
local inlay_hints = {
    includeInlayParameterNameHints = "all",
    includeInlayVariableTypeHints = true,
    includeInlayFunctionParameterTypeHints = true,
    includeInlayFunctionLikeReturnTypeHints = true,
}

return {
    settings = {
        typescript = { inlayHints = inlay_hints },
        javascript = { inlayHints = inlay_hints },
    },
}
