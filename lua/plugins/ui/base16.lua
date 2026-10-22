-- mini.base16: builds a full colorscheme from a 16-color base16 palette. Used by
-- themes/colors/theme.lua for ~/.theme palettes that don't name a plugin colorscheme.

return {
    "nvim-mini/mini.base16",
    version = false,
    lazy = true, -- loaded by require("mini.base16") in themes/colors/theme.lua
}
