-- noice: popup cmdline, message history and nicer LSP hover/signature windows.
-- It also shows LSP progress, so no separate progress plugin is needed.

return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
        lsp = {
            -- Render LSP markdown (hover, signature help) with treesitter
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
            },
        },
        presets = {
            bottom_search = true, -- Use a classic bottom command-line for search
            command_palette = true, -- Position the command-line and popupmenu together
            long_message_to_split = true, -- Send long messages to a split window
            inc_rename = false, -- Disable the input dialog for inc-rename.nvim
            lsp_doc_border = false, -- Do not add a border to LSP hover docs and signature help
        },
    },
}
