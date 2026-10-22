-- Startup colorscheme: `theme` (themes/colors/theme.lua) = the palette chosen with the `theme`
-- shell command (~/.theme), re-applied live in every open Neovim when it changes.
-- FALLBACK is used on a machine without ~/.theme. Try another with :colorscheme <name>.
-- Plugin themes: plugins/ui/colorscheme.lua. Your own themes: <themes_dir>/colors/<name>.lua.

local themes_dir = vim.fn.stdpath("config") .. "/themes" -- move your themes folder: change only this path

local FALLBACK = "gruvbox"

-- Added after lazy.nvim has set up the runtimepath, so :colorscheme finds <themes_dir>/colors/
-- and themes can `require()` shared modules (e.g. a palette) from <themes_dir>/lua/.
vim.opt.rtp:prepend(vim.fs.normalize(themes_dir))

local function apply()
    local ok, err = pcall(vim.cmd.colorscheme, "theme")
    if not ok then
        vim.notify(("%s\nUsing %q"):format(err, FALLBACK), vim.log.levels.WARN)
        pcall(vim.cmd.colorscheme, FALLBACK)
    end
end

apply()

-- `theme` rewrites generated/stamp on every switch (also while previewing in its picker)
local generated = require("theme.palette").home .. "/generated"
if vim.uv.fs_stat(generated) then
    local timer = assert(vim.uv.new_timer())
    local watcher = assert(vim.uv.new_fs_event())
    watcher:start(generated, {}, function()
        timer:stop()
        timer:start(100, 0, vim.schedule_wrap(apply))
    end)
end
