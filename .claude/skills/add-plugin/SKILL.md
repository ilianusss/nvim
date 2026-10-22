---
name: add-plugin
description: How to add (or remove) a package in this Neovim config — a lazy.nvim plugin, an LSP server, a linter, a formatter, a completion source or a treesitter parser — which file to create or edit, where its keymaps go, and what to update afterwards. Use when installing, adding, removing or configuring any plugin or language tool.
---

# Adding a package

1. Find what kind of package it is:

| You want to add...                         | Section |
|--------------------------------------------|---------|
| A Neovim plugin (GitHub repo)              | 1       |
| A feature of a plugin already installed (blink source, snacks module) | 2 |
| A language server                          | 3       |
| A linter                                   | 4       |
| A formatter                                | 5       |
| A treesitter parser                        | 6       |

2. Always finish with "Verify" and update `plugins-list.md` (number, name, keymaps, what it does, repo).

## 1. A plugin

### Pick the folder (= section of plugins-list.md)

| Folder        | For                                                          |
|---------------|--------------------------------------------------------------|
| `core/`       | Mason and language-server plumbing                           |
| `ui/`         | look & feel: colorschemes, statusline, tabs, popups          |
| `navigation/` | files & navigation: explorer, finder, panels, sessions       |
| `editing/`    | completion, formatting, treesitter, folds, pairs, comments   |
| `git/`        | git signs, diffs, git UIs                                    |
| `lang/`       | one language's tooling, linters, schemas                     |
| `tools/`      | terminals, databases, external TUIs                          |
| `ai/`         | AI assistants                                                |

New folder? Add `{ import = "plugins.<name>" }` to `spec` in `lua/config/lazy.lua`, and a section
to `plugins-list.md`.

### Create `lua/plugins/<folder>/<plugin-name>.lua`

```lua
-- <plugin-name>: <one line saying what it does>

return {
    "owner/repo",
    cmd = { "SomeCommand" },        -- how it loads (see table below)
    dependencies = { "owner/dep" }, -- optional
    opts = {},                      -- passed to require("<module>").setup(opts)
}
```

- **No `keys = {}`.** Keymaps go in `lua/config/keymaps.lua` (next section).
- `opts = {...}` for a standard `setup()`; `config = function(_, opts) ... end` only for extra work.
- Code that must run before the plugin loads (vim.g variables, autocmds) goes in `init = function() ... end`.
- Pin a version when the README recommends it (`version = "^9"`, `version = "1.*"`).
- An external binary goes in Mason (section 5) or, if Mason doesn't have it, in README.md's list,
  and the code using it must check `vim.fn.executable("<bin>") == 1` so machines without it still start.

### How it loads (plugins don't load through keymaps declared in the spec)

| Trigger                                  | Use for                                           |
|------------------------------------------|---------------------------------------------------|
| `cmd = "Name"`                           | keymaps that run `<cmd>Name ...<CR>`              |
| nothing (lazy by default)                | keymaps that call `require("module")...`: lazy.nvim loads the plugin on `require` |
| `ft = { "rust" }`                        | single-language plugin                            |
| `event = { "BufReadPre", "BufNewFile" }` | needed as soon as a file is open                  |
| `event = "InsertEnter"`                  | insert-mode helpers                               |
| `event = "VeryLazy"`                     | UI or global behaviour right after startup        |
| `lazy = false`                           | only if the README says no lazy-loading           |

### Keymaps → `lua/config/keymaps.lua`

Add them in the block of the matching section, always with `desc`:

```lua
map("n", "<leader>xy", "<cmd>SomeCommand<CR>", { desc = "What it does" })
map("n", "<leader>xz", function() require("module").fn() end, { desc = "What it does" })
```

- LSP actions: inside the `LspAttach` autocmd at the end of the file (buffer-local).
- A new `<leader>` prefix: add its label to `M.groups` (which-key).
- Completion menu keys: `M.completion`.
- Check the key is free first: `grep -n '"<leader>xy"' lua/config/keymaps.lua` and `:verbose nmap <key>`.

## 2. A feature of an installed plugin

Make a separate file with a partial spec of that plugin; lazy.nvim merges it:

```lua
-- lua/plugins/<folder>/<feature>.lua
return {
    "saghen/blink.cmp",
    dependencies = { "owner/blink-source" },
    opts = {
        sources = {
            default = { "newsource" }, -- appended (blink spec has opts_extend for this list)
            providers = { newsource = { name = "New", module = "blink-source" } },
        },
    },
}
```

Same for a snacks module: `return { "folke/snacks.nvim", opts = { <module> = { ... } } }`.

## 3. A language server

1. Add its lspconfig name (`:help lspconfig-all`) to `ensure_installed` in
   `lua/plugins/core/mason.lua`, under "LSP servers". Mason installs it, mason-lspconfig enables it.
2. Custom settings only: create `after/lsp/<name>.lua` returning a table:
   ```lua
   -- Merged on top of nvim-lspconfig's defaults for <name>
   return { settings = { ... } }
   ```
   Use `after/lsp/`, not `lsp/` (nvim-lspconfig's own files would override yours).
3. If a plugin starts the server itself (rustaceanvim), add it to `automatic_enable.exclude` in
   `lua/plugins/core/lspconfig.lua`.
4. If its files need a special filetype (like Helm or docker-compose), add a rule to
   `lua/config/filetypes.lua`.

## 4. A linter

1. Add the Mason package to `ensure_installed` (under "Linters") in `lua/plugins/core/mason.lua`.
2. Map it in `linters_by_ft` in `lua/plugins/lang/lint.lua` (name from `:help nvim-lint`).
3. If Mason also maps it to an LSP (`:Mason` shows an lspconfig name), add that name to
   `automatic_enable.exclude` in `lua/plugins/core/lspconfig.lua`, or it runs twice.

## 5. A formatter (or any CLI tool)

1. Add the Mason package name (see `:Mason`) to `ensure_installed` in `lua/plugins/core/mason.lua`.
2. For a formatter, map it in `formatters_by_ft` in `lua/plugins/editing/formatting.lua`
   (conform name from `:help conform-formatters`). Same LSP-mode rule as linters.

## 6. A treesitter parser

Parsers install automatically the first time a file of that language opens. To pre-install,
add it to `ensure_installed` at the top of `lua/plugins/editing/treesitter.lua`.

## Removing a package

Delete its spec file (or remove it from the Mason list), remove its keymaps from
`lua/config/keymaps.lua`, its row from `plugins-list.md`, then `nvim --headless "+Lazy! sync" +qa`.
A Mason package stays installed until `:MasonUninstall <name>`; an installed server keeps being
enabled until then.

## Verify

```sh
nvim --headless "+Lazy! sync" +qa      # installs the plugin, updates lazy-lock.json
nvim --headless "+MasonToolsInstallSync" +qa   # installs new Mason tools
nvim --headless "+lua vim.defer_fn(function() print(vim.api.nvim_exec2('messages',{output=true}).output) vim.cmd('qa!') end, 2000)"
~/.local/share/nvim/mason/bin/stylua --check .
```

Then in Neovim: `:Lazy` (loaded?), `:checkhealth <plugin>`, `:checkhealth vim.lsp` with a file of
that language open, `:ConformInfo` for formatters.
