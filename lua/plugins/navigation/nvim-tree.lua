-- nvim-tree: file explorer sidebar (also replaces netrw, so `nvim .` opens it)

return {
    "nvim-tree/nvim-tree.lua",
    lazy = false, -- must be loaded at startup to take over directory buffers
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        disable_netrw = true,
        hijack_netrw = true,
        view = {
            width = 35,
            relativenumber = true,
        },
        renderer = {
            icons = {
                glyphs = {
                    folder = {
                        arrow_closed = "\u{f061}", -- arrow when folder is closed
                        arrow_open = "\u{f063}", -- arrow when folder is open
                    },
                },
            },
        },
        actions = {
            open_file = {
                window_picker = {
                    enable = false,
                },
            },
        },
        filters = {
            custom = { ".DS_Store" },
        },
        git = {
            ignore = false,
        },
    },
}
