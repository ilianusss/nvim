-- theme: the palette selected with the `theme` shell command (~/.theme, see its AGENTS.md).
-- A palette with nvim_colorscheme=<name> uses that colorscheme (it must be on the runtimepath:
-- plugin colorschemes are lazy = false); any other one is built by mini.base16 from base00..base0F.

local palette = require("theme.palette").read()
if not palette then
    error("theme: no palette selected, run `theme colors <name>` in a shell")
end

vim.o.background = palette.variant == "light" and "light" or "dark"

if palette.nvim_colorscheme then
    -- Sourced, not :colorscheme'd: Neovim ignores a :colorscheme run from inside a colorscheme
    local name = palette.nvim_colorscheme
    local file = vim.api.nvim_get_runtime_file("colors/" .. name .. ".{lua,vim}", false)[1]
    if not file then
        error(("theme: colorscheme %q (nvim_colorscheme) not found"):format(name))
    end
    vim.cmd.source(file)
    return
end

local base16 = {}
for i = 0, 15 do
    local key = ("base%02X"):format(i)
    base16[key] = palette[key]
end
require("mini.base16").setup({ palette = base16 })
vim.g.colors_name = "theme"
