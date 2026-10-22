-- Load order matters: options sets the leader keys, which lazy.nvim needs before plugins
-- load; the colorscheme is applied once every plugin is registered.
require("config.options")
require("config.filetypes")
require("config.keymaps")
require("config.autocmds")
require("config.lsp")
require("config.lazy")
require("config.colorscheme")
