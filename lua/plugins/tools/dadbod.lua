-- vim-dadbod + dadbod-ui: database explorer and query runner (PostgreSQL, MySQL, SQLite,
-- MongoDB, Redis...). Needs each database's client on the machine (psql, mongosh, redis-cli...).
-- vim-dadbod-completion adds table / column completion to blink.cmp in SQL buffers.

return {
    {
        "kristijanhusak/vim-dadbod-ui",
        cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
        dependencies = {
            { "tpope/vim-dadbod", lazy = true },
            { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
        },
        init = function()
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    },
    {
        "saghen/blink.cmp",
        opts = {
            sources = {
                per_filetype = {
                    sql = { "snippets", "dadbod", "buffer" },
                    mysql = { "snippets", "dadbod", "buffer" },
                    plsql = { "snippets", "dadbod", "buffer" },
                },
                providers = {
                    dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
                },
            },
        },
    },
}
