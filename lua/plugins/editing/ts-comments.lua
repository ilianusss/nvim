-- ts-comments: makes the built-in `gc` use the right comment syntax for the language under
-- the cursor (e.g. {/* */} inside JSX/TSX, <!-- --> in Vue templates)

return {
    "folke/ts-comments.nvim",
    event = "VeryLazy",
    opts = {},
}
