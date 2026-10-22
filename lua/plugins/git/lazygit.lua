-- lazygit (snacks module): runs lazygit in a floating window to stage, commit, rebase and push.
-- Uses the current colorscheme. Needs the `lazygit` binary (see README.md).

return {
    "folke/snacks.nvim",
    opts = {
        lazygit = {},
    },
}
