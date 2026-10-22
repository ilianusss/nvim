-- lazy.nvim: plugin manager. Bootstraps itself on first launch, then loads every spec
-- file found in the plugin categories below (one file per plugin, see AGENTS.md).
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "plugins.core" }, -- Mason + language servers
        { import = "plugins.ui" }, -- look & feel: colorschemes, statusline, tabs, popups
        { import = "plugins.navigation" }, -- files & navigation: explorer, finder, panels
        { import = "plugins.editing" }, -- completion, formatting, treesitter, folds
        { import = "plugins.git" }, -- git signs, diffs
        { import = "plugins.lang" }, -- language-specific tooling and linters
        { import = "plugins.tools" }, -- terminal, databases
        { import = "plugins.ai" }, -- Copilot
    },
    install = { colorscheme = { "gruvbox", "habamax" } },
    checker = { enabled = true, notify = false }, -- check for plugin updates in the background
    change_detection = { notify = false },
    rocks = { enabled = false }, -- no plugin here needs luarocks
    performance = {
        rtp = {
            disabled_plugins = { "gzip", "netrwPlugin", "tarPlugin", "tohtml", "tutor", "zipPlugin" },
        },
    },
})
