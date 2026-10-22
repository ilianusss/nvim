-- Merged on top of nvim-lspconfig's defaults for clangd
return {
    cmd = { "clangd", "--background-index", "--clang-tidy" },
}
