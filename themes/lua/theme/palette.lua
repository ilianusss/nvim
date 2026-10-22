-- Reads the palette selected with the `theme` shell command: $THEME_HOME/current/colors/palette
-- (key="value" lines; format in ~/.theme/AGENTS.md).

local M = {}

M.home = vim.env.THEME_HOME or vim.fs.normalize("~/.theme")

---@return table<string, string>|nil
function M.read()
    local f = io.open(M.home .. "/current/colors/palette", "r")
    if not f then
        return nil
    end
    local palette = {}
    for line in f:lines() do
        local key, rest = line:match("^%s*([%w_]+)=(.*)$")
        if key then
            palette[key] = rest:match('^"([^"]*)"') or rest:match("^(%S*)")
        end
    end
    f:close()
    return palette
end

return M
