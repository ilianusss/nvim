-- conform: runs formatters on save (and with the format keymap), falling back to the LSP
-- formatter. Formatter binaries are installed by Mason (plugins/core/mason.lua), except
-- gofmt and rustfmt which come with the Go and Rust toolchains.

return {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = "ConformInfo",
    opts = {
        formatters_by_ft = {
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            json = { "prettier" },
            jsonc = { "prettier" },
            markdown = { "prettier" },
            css = { "prettier" },
            html = { "prettier" },
            python = { "black" },
            lua = { "stylua" },
            c = { "clang-format" },
            go = { "goimports", "gofmt" },
            rust = { "rustfmt" },
            terraform = { "terraform_fmt" },
            ["terraform-vars"] = { "terraform_fmt" },
            sh = { "shfmt" },
            bash = { "shfmt" },
            yaml = { "yamlfmt" },
            sql = { "sqlfluff" },
        },
        formatters = {
            sqlfluff = {
                require_cwd = false, -- also format in projects without a sqlfluff config
                args = function(_, ctx)
                    if vim.fs.root(ctx.dirname, ".sqlfluff") then
                        return { "fix", "-" }
                    end
                    return { "fix", "--dialect=" .. vim.g.sqlfluff_dialect, "-" }
                end,
                exit_codes = { 0, 1 }, -- 1 = formatted, but some violations can't be auto-fixed
            },
        },
        default_format_opts = {
            lsp_format = "fallback",
            timeout_ms = 1000,
        },
        format_on_save = {
            lsp_format = "fallback",
            timeout_ms = 1000,
        },
    },
}
