-- todo-comments: highlights TODO/FIX/HACK/NOTE comments and lists them (telescope, trouble)

return {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TodoTelescope", "TodoTrouble" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
}
