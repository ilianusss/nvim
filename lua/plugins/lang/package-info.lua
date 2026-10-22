-- package-info: shows the latest available version next to each dependency in package.json
-- (needs npm)

return {
    "vuki656/package-info.nvim",
    event = "BufRead package.json",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
}
