-- lualine: statusline at the bottom (mode, git branch, diagnostics, file info)

return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            theme = "auto",
        },
    },
}
