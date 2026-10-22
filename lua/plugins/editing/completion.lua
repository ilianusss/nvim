-- blink.cmp: completion menu (LSP, paths, snippets, buffer words).
-- It also advertises its completion capabilities to every LSP server automatically.
-- Snippets: your own VS Code-style JSON files in ~/.config/nvim/snippets/ (optional).
-- Extra sources are added by the files that need them: Copilot (plugins/ai/copilot.lua),
-- SQL / dadbod (plugins/tools/dadbod.lua), Neovim Lua API (plugins/lang/lazydev.lua).

return {
    "saghen/blink.cmp",
    version = "1.*", -- release tags ship prebuilt binaries (macOS/Linux), no Rust toolchain needed
    event = { "InsertEnter", "CmdlineEnter" }, -- also loaded early by plugins/core/lspconfig.lua
    opts_extend = { "sources.default" }, -- lets other files append to sources.default
    opts = {
        keymap = require("config.keymaps").completion,
        completion = { documentation = { auto_show = true } },
        sources = { default = { "lsp", "path", "snippets", "buffer" } },
    },
}
