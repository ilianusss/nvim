-- snacks: collection of small QoL modules, each enabled individually below.
-- Also provides helpers used elsewhere: Snacks.bufdelete (bufferline), Snacks.dim (focus mode),
-- Snacks.lazygit (plugins/git/lazygit.lua), Snacks.terminal (plugins/tools/terminal.lua).

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        indent = { enabled = true }, -- Show indent lines
        notifier = { enabled = true }, -- Better notifications
        quickfile = { enabled = true }, -- Render files opened from the cmdline before plugins load
        scope = { enabled = true }, -- Detect the current scope (used by indent and dim)
        scroll = { enabled = true }, -- Smooth scrolling (set to false to turn it off)
        statuscolumn = { enabled = true }, -- Sign / number / fold column
    },
}
