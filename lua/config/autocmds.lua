local function augroup(name)
    return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = augroup("highlight_yank"),
    callback = function()
        vim.hl.on_yank()
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    desc = "Wrap long lines in markdown files",
    group = augroup("wrap_markdown"),
    pattern = "markdown",
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
    end,
})

-- Reopen files where you left them (see :h restore-cursor)
vim.api.nvim_create_autocmd("BufReadPost", {
    desc = "Restore last cursor position",
    group = augroup("restore_cursor"),
    callback = function(ev)
        vim.api.nvim_create_autocmd("FileType", {
            buffer = ev.buf,
            once = true,
            callback = function()
                local ft = vim.bo[ev.buf].filetype
                if ft == "gitcommit" or ft == "gitrebase" then
                    return
                end
                local mark = vim.api.nvim_buf_get_mark(ev.buf, '"')
                if mark[1] > 1 and mark[1] <= vim.api.nvim_buf_line_count(ev.buf) then
                    pcall(vim.api.nvim_win_set_cursor, 0, mark)
                end
            end,
        })
    end,
})
