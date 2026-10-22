-- nvim-treesitter-context: pins the header of the current function / class at the top of the
-- window while you scroll through its body (VS Code "sticky scroll")

return {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPost",
    opts = {
        max_lines = 3, -- never take more than 3 lines of the window
    },
}
