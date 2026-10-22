-- diffview: side-by-side diff of every modified file (:DiffviewOpen), history of a file or
-- branch (:DiffviewFileHistory %), and a 3-way editor to resolve merge conflicts

return {
    "sindrets/diffview.nvim",
    cmd = {
        "DiffviewOpen",
        "DiffviewClose",
        "DiffviewToggleFiles",
        "DiffviewFocusFiles",
        "DiffviewRefresh",
        "DiffviewFileHistory",
    },
    opts = {},
}
