-- persistence: saves the open files per folder on exit and restores them when `nvim` is
-- started with no arguments in that folder (VS Code-style workspace restore)

return {
    "folke/persistence.nvim",
    event = "BufReadPre", -- start recording the session once a file is opened
    opts = {},
    init = function()
        local group = vim.api.nvim_create_augroup("user_persistence", { clear = true })

        vim.api.nvim_create_autocmd("VimEnter", {
            group = group,
            nested = true, -- let restored buffers trigger their FileType / LSP autocmds
            callback = function()
                if vim.fn.argc() == 0 and not vim.g.started_with_stdin then
                    require("persistence").load()
                end
            end,
        })
        vim.api.nvim_create_autocmd("StdinReadPre", {
            group = group,
            callback = function()
                vim.g.started_with_stdin = true
            end,
        })
        -- An open file tree would be saved as an empty buffer
        vim.api.nvim_create_autocmd("User", {
            group = group,
            pattern = "PersistenceSavePre",
            callback = function()
                pcall(vim.cmd, "NvimTreeClose")
            end,
        })
    end,
}
