-- gitsigns: git added/changed/deleted markers in the sign column, hunk preview/reset and
-- inline blame of the current line (toggled with a keymap, off by default)

return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        current_line_blame = false,
    },
}
