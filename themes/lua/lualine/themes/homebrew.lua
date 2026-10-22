-- lualine theme: options = { theme = "homebrew" }
local p = {
    dark = {
        bg0 = "#221e1a",
        bg1 = "#342e28",
        bg2 = "#443b32",
        fg = "#f1dbb2",
        muted = "#a8957a",
        amber = "#fbb040",
        ice = "#86bcd0",
        plum = "#cc9cc4",
        red = "#ec7f72",
        green = "#93c07e",
    },
    light = {
        bg0 = "#efe1c4",
        bg1 = "#f4e7cd",
        bg2 = "#e8d6b3",
        fg = "#362c22",
        muted = "#7c6b4e",
        amber = "#9a5c08",
        ice = "#2a6f8a",
        plum = "#8c3f7e",
        red = "#b23a2c",
        green = "#4f7a28",
    },
}
local c = p[vim.o.background == "light" and "light" or "dark"]
local function mode(accent)
    return {
        a = { fg = c.bg0, bg = accent, gui = "bold" },
        b = { fg = c.fg, bg = c.bg2 },
        c = { fg = c.muted, bg = c.bg0 },
    }
end
return {
    normal = mode(c.amber),
    insert = mode(c.green),
    visual = mode(c.plum),
    replace = mode(c.red),
    command = mode(c.ice),
    inactive = { a = { fg = c.muted, bg = c.bg0 }, b = { fg = c.muted, bg = c.bg0 }, c = { fg = c.muted, bg = c.bg0 } },
}
