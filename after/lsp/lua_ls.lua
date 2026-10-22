-- Merged on top of nvim-lspconfig's defaults for lua_ls
-- (Neovim API and plugin types come from lazydev, see plugins/lang/lazydev.lua)
return {
    settings = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
}
