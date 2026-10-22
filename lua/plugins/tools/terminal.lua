-- terminal (snacks module): toggleable floating terminal. Also hosts lazydocker and k9s
-- (keymaps in config/keymaps.lua; both binaries must be installed, see README.md).
-- Inside a terminal: <Esc><Esc> goes to normal mode, then `q` hides it.

return {
    "folke/snacks.nvim",
    opts = {
        terminal = {
            win = { position = "float" }, -- the plain shell floats too (default: bottom split)
        },
    },
}
