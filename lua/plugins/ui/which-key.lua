-- which-key: after pressing <leader> (or g, z, [...), a popup lists the keys you can press next,
-- using the `desc` of each mapping in config/keymaps.lua

return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        spec = require("config.keymaps").groups,
    },
}
