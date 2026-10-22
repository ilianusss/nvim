-- bufferline: open buffers shown as tabs along the top

return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            -- Keeps the window layout (and nvim-tree) in place when a buffer is closed
            close_command = function(bufnr)
                Snacks.bufdelete(bufnr)
            end,
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "Nvim Tree",
                    separator = false,
                    text_align = "center",
                },
            },
        },
    },
}
