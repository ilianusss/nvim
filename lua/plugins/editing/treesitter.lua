-- nvim-treesitter: installs language parsers used for highlighting, indentation and by
-- other plugins (noice, flash, ufo...). Highlighting itself is built into Neovim; this
-- file turns it on per buffer and auto-installs a missing parser when a filetype opens.
-- Building parsers needs the `tree-sitter` CLI, which Mason installs (plugins/core/mason.lua).

local ensure_installed = {
    -- Languages you work with (any other one is installed the first time you open it)
    "bash",
    "c",
    "css",
    "diff",
    "dockerfile",
    "go",
    "hcl",
    "helm",
    "html",
    "javascript",
    "json",
    "lua",
    "python",
    "rust",
    "sql",
    "terraform",
    "toml",
    "tsx",
    "typescript",
    "yaml",
    -- Needed by noice / render-markdown (cmdline, LSP docs, Markdown rendering)
    "markdown",
    "markdown_inline",
    "regex",
    "vim",
    "vimdoc",
}

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false, -- does not support lazy-loading
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")

        local function can_build()
            return vim.fn.executable("tree-sitter") == 1
        end

        if can_build() then
            ts.install(ensure_installed) -- no-op for parsers already installed
        else
            -- Fresh machine: wait for Mason to install tree-sitter-cli, then install parsers
            vim.api.nvim_create_autocmd("User", {
                pattern = "MasonToolsUpdateCompleted",
                once = true,
                callback = function()
                    if can_build() then
                        ts.install(ensure_installed)
                    end
                end,
            })
        end

        local available = {}
        for _, lang in ipairs(ts.get_available()) do
            available[lang] = true
        end

        local function attach(buf, lang)
            if not pcall(vim.treesitter.start, buf, lang) then
                return
            end
            if vim.treesitter.query.get(lang, "indents") then
                vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end
        end

        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("user_treesitter", { clear = true }),
            callback = function(ev)
                local lang = vim.treesitter.language.get_lang(ev.match)
                if not lang then
                    return
                end

                if vim.treesitter.language.add(lang) then
                    attach(ev.buf, lang)
                elseif available[lang] and can_build() then
                    ts.install(lang):await(function()
                        if vim.api.nvim_buf_is_valid(ev.buf) then
                            attach(ev.buf, lang)
                        end
                    end)
                end
            end,
        })
    end,
}
