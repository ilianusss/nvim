-- Mason: installs LSP servers, linters, formatters and CLI tools inside Neovim's data dir
-- (same on macOS and Linux) and puts them on $PATH. `:Mason` shows what is installed.
-- ensure_installed below is THE list of external tools this config depends on; anything
-- Mason can't provide is listed in README.md.

return {
    {
        "mason-org/mason.nvim",
        lazy = false, -- cheap; other plugins need its bin/ on $PATH from the start
        opts = {},
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        event = "VeryLazy",
        cmd = { "MasonToolsInstall", "MasonToolsInstallSync", "MasonToolsUpdate", "MasonToolsClean" },
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim", -- lets the list below use lspconfig server names
        },
        opts = {
            ensure_installed = {
                -- LSP servers (lspconfig names; custom settings in after/lsp/<name>.lua)
                "basedpyright", -- Python
                "bashls", -- shell
                "clangd", -- C
                "cssls", -- CSS
                "docker_compose_language_service", -- docker-compose files
                "dockerls", -- Dockerfile
                "gopls", -- Go
                "helm_ls", -- Helm
                "html", -- HTML
                "jsonls", -- JSON (+ SchemaStore)
                "lua_ls", -- Lua
                "marksman", -- Markdown
                "rust_analyzer", -- Rust (started by rustaceanvim, see plugins/lang/rust.lua)
                "sqls", -- SQL
                "tailwindcss", -- Tailwind CSS
                "terraformls", -- Terraform
                "vtsls", -- TypeScript / JavaScript
                "yamlls", -- YAML (+ SchemaStore, Kubernetes)
                -- Linters (used by plugins/lang/lint.lua)
                "eslint_d",
                "hadolint",
                "markdownlint-cli2",
                "ruff",
                "shellcheck",
                "sqlfluff", -- also formats SQL
                "tflint",
                -- Formatters (used by plugins/editing/formatting.lua)
                "black",
                "clang-format",
                "goimports",
                "prettier",
                "shfmt",
                "stylua",
                "yamlfmt",
                -- CLI tools
                "jq", -- reformat large JSON: :%!jq .
                "terraform", -- `terraform fmt`
                "tree-sitter-cli", -- builds treesitter parsers
            },
        },
        config = function(_, opts)
            local installer = require("mason-tool-installer")
            installer.setup(opts)
            -- Its own VimEnter hook has already passed when lazy-loaded, so start it here
            installer.run_on_start()
        end,
    },
}
