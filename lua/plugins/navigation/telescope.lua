-- telescope: fuzzy finder for files, text, LSP symbols, git changes, projects and undo history

return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        {
            "nvim-telescope/telescope-fzf-native.nvim", -- Native fzf sorter (faster, fzf syntax)
            build = "make",
            cond = vim.fn.executable("make") == 1,
        },
        "nvim-telescope/telescope-ui-select.nvim", -- Use telescope for vim.ui.select
        "nvim-telescope/telescope-project.nvim", -- Project management
        "debugloop/telescope-undo.nvim", -- Undo history search
    },
    init = function()
        -- Load telescope the first time something asks for a selection (e.g. code actions)
        ---@diagnostic disable-next-line: duplicate-set-field
        vim.ui.select = function(...)
            require("lazy").load({ plugins = { "telescope.nvim" } })
            return vim.ui.select(...)
        end
    end,
    config = function()
        local telescope = require("telescope")

        telescope.setup({
            extensions = {
                ["ui-select"] = { require("telescope.themes").get_dropdown({}) },
                project = {
                    hidden_files = true,
                },
            },
        })

        pcall(telescope.load_extension, "fzf") -- absent when `make` is not installed
        telescope.load_extension("ui-select")
        telescope.load_extension("project")
        telescope.load_extension("undo")
    end,
}
