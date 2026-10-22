-- nvim-lint: runs linters that aren't language servers and reports their results as
-- diagnostics (signs, virtual lines, trouble panel). Linters are installed by Mason.

local linters_by_ft = {
    javascript = { "eslint_d" },
    typescript = { "eslint_d" },
    javascriptreact = { "eslint_d" },
    typescriptreact = { "eslint_d" },
    python = { "ruff" },
    sh = { "shellcheck" },
    bash = { "shellcheck" },
    dockerfile = { "hadolint" },
    terraform = { "tflint" },
    sql = { "sqlfluff" },
}

-- eslint_d errors out in projects without an ESLint config, so only run it where one exists
local eslint_configs = {
    "eslint.config.js",
    "eslint.config.mjs",
    "eslint.config.cjs",
    "eslint.config.ts",
    ".eslintrc",
    ".eslintrc.js",
    ".eslintrc.cjs",
    ".eslintrc.json",
    ".eslintrc.yml",
    ".eslintrc.yaml",
}

return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufNewFile", "BufWritePost" },
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = linters_by_ft

        -- sqlfluff refuses to run without a dialect: use the default one outside projects
        -- that have a .sqlfluff config (see vim.g.sqlfluff_dialect in config/options.lua)
        local sqlfluff = lint.linters.sqlfluff
        lint.linters.sqlfluff = function()
            local linter = vim.deepcopy(sqlfluff)
            if not vim.fs.root(0, ".sqlfluff") then
                linter.args = { "lint", "--format=json", "--dialect=" .. vim.g.sqlfluff_dialect, "-" }
            end
            return linter
        end

        local function installed(name)
            local linter = lint.linters[name]
            if type(linter) == "function" then
                linter = linter()
            end
            local cmd = linter and linter.cmd
            if type(cmd) == "function" then
                cmd = cmd()
            end
            return type(cmd) == "string" and vim.fn.executable(cmd) == 1
        end

        local function linters_for(buf)
            local names = {}
            for _, ft in ipairs(vim.split(vim.bo[buf].filetype, ".", { plain = true })) do
                for _, name in ipairs(linters_by_ft[ft] or {}) do
                    local wanted = name ~= "eslint_d" or vim.fs.root(buf, eslint_configs) ~= nil
                    if wanted and installed(name) then
                        table.insert(names, name)
                    end
                end
            end
            return names
        end

        vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
            group = vim.api.nvim_create_augroup("user_lint", { clear = true }),
            callback = function(ev)
                local names = linters_for(ev.buf)
                if #names > 0 then
                    lint.try_lint(names)
                end
            end,
        })
    end,
}
