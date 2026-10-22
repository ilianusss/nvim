# Neovim config

Neovim (0.12+) config for macOS and Linux, used instead of VS Code. Claude Code CLI writes the
code and runs the tests; Neovim is for reading diffs and files, small edits and debugging.

- `plugins-list.md`: inventory of every plugin/tool with its keymaps and repo. Keep it in sync.

## Layout

```
init.lua                    -> require("config")
lua/config/                 core, no plugin required
  options.lua               vim options, leader keys, vim.g.sqlfluff_dialect
  filetypes.lua             extra filetype rules (Helm, docker-compose)
  keymaps.lua               ALL keymaps + which-key groups + completion menu keys
  autocmds.lua              yank highlight, restore cursor
  lsp.lua                   diagnostics display, reference highlight
  lazy.lua                  lazy.nvim bootstrap + list of plugin folders
  colorscheme.lua           themes_dir, startup colorscheme (`theme`), live reload from ~/.theme
lua/plugins/<section>/      one spec per plugin; folders = sections of plugins-list.md
  core/ ui/ navigation/ editing/ git/ lang/ tools/ ai/
after/lsp/<server>.lua      per-server LSP settings (merged over nvim-lspconfig defaults)
themes/                     own colorschemes + colors/theme.lua (the ~/.theme palette), see themes/README.md
```

## Conventions

- **Keymaps only in `lua/config/keymaps.lua`**, each with a `desc`. Specs never use `keys = {}`;
  a plugin loads through `cmd`, `event`, `ft`, or when a keymap `require()`s it.
- **Tools only in `lua/plugins/core/mason.lua`** (`ensure_installed`). Binaries Mason can't
  provide are listed in README.md.
- **One plugin (or feature) per file.** A feature built on another plugin is its own file with a
  partial spec of that plugin, which lazy.nvim merges: `ai/copilot.lua` adds a blink.cmp source,
  `git/lazygit.lua` and `tools/terminal.lua` configure snacks modules. Deleting the file (and its
  keymaps) removes the feature.
- A tool with an LSP mode used here as linter/formatter (ruff, tflint, stylua) is excluded in
  `automatic_enable.exclude` (`core/lspconfig.lua`).
- Lua is formatted with stylua (`.stylua.toml`), also on save.

## Adding / removing things

Follow `.claude/skills/add-plugin/SKILL.md`, then update `plugins-list.md`.

## Verify a change

```sh
# Startup errors / warnings
nvim --headless "+lua vim.defer_fn(function() print(vim.api.nvim_exec2('messages',{output=true}).output) vim.cmd('qa!') end, 2000)"
# Deprecations and plugin manager health
nvim --headless "+checkhealth vim.deprecated lazy" "+w! /tmp/health.txt" +qa && grep -E "WARNING|ERROR" /tmp/health.txt
```

Headless scripts that open files must always end in `qa!`, even on error (wrap the work in
`pcall`), or Neovim keeps running.
