# Plugins list

Everything installed by this config, by section (same sections as `FEATURES-V2.md` and as the
folders in `lua/plugins/`). Every keymap is defined in `lua/config/keymaps.lua`.
`<leader>` is Space. Press it and wait to see the keymaps in the which-key popup.

## A. Core — `lua/plugins/core/`

| # | Name | Keymapping | What it does | GitHub repo |
|---|---|---|---|---|
| 1 | lazy.nvim | `:Lazy` | Plugin manager: installs, updates and lazy-loads plugins | [folke/lazy.nvim](https://github.com/folke/lazy.nvim) |
| 2 | mason.nvim | `:Mason` | Installs LSP servers, linters, formatters and CLI tools on macOS and Linux | [mason-org/mason.nvim](https://github.com/mason-org/mason.nvim) |
| 3 | mason-tool-installer.nvim | `:MasonToolsInstall` `:MasonToolsUpdate` | The single list of tools (`core/mason.lua`); installs anything missing at startup | [WhoIsSethDaniel/mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) |
| 4 | mason-lspconfig.nvim | — | Starts every language server Mason has installed | [mason-org/mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim) |
| 5 | nvim-lspconfig | — | Default config (command, filetypes, root) for each language server | [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) |
| 6 | Built-in LSP setup (`config/lsp.lua`) | `gd` definitions · `gR` references · `gi` implementations · `gt` type definitions · `gD` declaration · `K` hover · `<leader>ca` code actions · `<leader>rn` rename · `<leader>D` buffer diagnostics · `<leader>rs` restart LSP | Highlights other uses of the symbol under the cursor; diagnostics as virtual lines on the current line | Neovim built-in |

## B. Look & feel — `lua/plugins/ui/`

| # | Name | Keymapping | What it does | GitHub repo |
|---|---|---|---|---|
| 7 | gruvbox.nvim | `:colorscheme gruvbox` | Colorscheme used when `~/.theme` is missing (`FALLBACK` in `config/colorscheme.lua`) | [ellisonleao/gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) |
| 8 | kanagawa-paper.nvim | `:colorscheme kanagawa-paper` | Colorscheme of the `kanagawa-paper-ink` palette (`nvim_colorscheme` in `~/.theme`) | [thesimonho/kanagawa-paper.nvim](https://github.com/thesimonho/kanagawa-paper.nvim) |
| 9 | Themes folder (`themes/`) | `:colorscheme <name>` · `:colorscheme theme` back to the shared one | Your own themes: `themes/colors/<name>.lua`. `colors/theme.lua` = the palette picked with the `theme` shell command (`~/.theme`), applied at startup and re-applied live when it changes. Path set by `themes_dir` in `config/colorscheme.lua` | Neovim built-in |
| 10 | mini.base16 | — | Builds the colorscheme from a `~/.theme` palette's 16 base16 colors when the palette names no plugin colorscheme | [nvim-mini/mini.base16](https://github.com/nvim-mini/mini.base16) |
| 11 | lualine.nvim | — | Status bar: mode, git branch, diagnostics, file info | [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) |
| 12 | bufferline.nvim | `Alt-←` / `Alt-→` switch · `Alt-s` sort · `<leader>qp` pick a tab to close · `<leader>qa` close the others | Open buffers shown as tabs | [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim) |
| 13 | noice.nvim | — | Popup command line, message history, nicer LSP hover, LSP progress | [folke/noice.nvim](https://github.com/folke/noice.nvim) |
| 14 | snacks.nvim (notifier, indent, scope, scroll, statuscolumn, quickfile) | — | Notification popups, indent guides, scope detection, smooth scrolling (one-line toggle), sign/fold column, fast first render | [folke/snacks.nvim](https://github.com/folke/snacks.nvim) |
| 15 | snacks.dim | `<leader>tw` | Focus mode: dims everything outside the current block | [folke/snacks.nvim](https://github.com/folke/snacks.nvim) |
| 16 | nvim-colorizer.lua | — | Shows `#ff8800`, `rgb()`... in their color | [catgoose/nvim-colorizer.lua](https://github.com/catgoose/nvim-colorizer.lua) |
| 17 | which-key.nvim | press `<leader>` and wait | Popup listing the available keys and their description | [folke/which-key.nvim](https://github.com/folke/which-key.nvim) |
| 18 | nvim-treesitter-context | — | Pins the current function/class header at the top while scrolling | [nvim-treesitter/nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) |
| 19 | render-markdown.nvim | — | Renders Markdown headings, tables and checkboxes in the buffer (raw on the cursor line) | [MeanderingProgrammer/render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) |

## C. Files & navigation — `lua/plugins/navigation/`

| # | Name | Keymapping | What it does | GitHub repo |
|---|---|---|---|---|
| 20 | nvim-tree.lua | `<leader>E` toggle · `<leader>e` focus · `<leader>w` reveal current file | File explorer sidebar | [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) |
| 21 | telescope.nvim | `<leader>ff` files · `<leader>fg` live grep · `<leader>fc` word under cursor · `<leader>gs` git status · `<leader>gc` commits · `<leader>gf` commits of current file | Fuzzy finder; the git pickers are the entry point to review what Claude Code changed | [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) |
| 22 | telescope-fzf-native.nvim | — | Faster, fzf-style sorting of telescope results | [nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) |
| 23 | telescope-ui-select.nvim | — (used by `<leader>ca`) | Shows selection menus (code actions...) in telescope | [nvim-telescope/telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim) |
| 24 | telescope-project.nvim | `<leader>fp` | Switch between projects | [nvim-telescope/telescope-project.nvim](https://github.com/nvim-telescope/telescope-project.nvim) |
| 25 | telescope-undo.nvim | `<leader>fu` | Browse and restore undo history | [debugloop/telescope-undo.nvim](https://github.com/debugloop/telescope-undo.nvim) |
| 26 | todo-comments.nvim | `<leader>ft` (telescope) · `<leader>xt` (trouble) | Highlights TODO/FIX/HACK/NOTE comments and lists them | [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim) |
| 27 | flash.nvim | `s` jump · `S` treesitter jump · `r` remote (operator) · `R` treesitter search · `<C-s>` toggle in `/` search | Jump anywhere on screen with a couple of letters + a label | [folke/flash.nvim](https://github.com/folke/flash.nvim) |
| 28 | persistence.nvim | `<leader>qs` restore this folder's session · `<leader>ql` restore last · `<leader>qd` don't save on exit | Saves open files per folder; plain `nvim` in that folder reopens them | [folke/persistence.nvim](https://github.com/folke/persistence.nvim) |
| 29 | trouble.nvim | `<leader>xx` all diagnostics · `<leader>xX` buffer diagnostics · `<leader>xt` todos · `<leader>xq` quickfix · `<leader>xl` location list | Panel for diagnostics (LSP + nvim-lint), TODOs, quickfix | [folke/trouble.nvim](https://github.com/folke/trouble.nvim) |
| 30 | aerial.nvim | `<leader>o` | Symbols outline sidebar for the current file | [stevearc/aerial.nvim](https://github.com/stevearc/aerial.nvim) |
| 31 | glance.nvim | `<leader>pd` definitions · `<leader>pr` references · `<leader>pi` implementations · `<leader>pt` type definitions | Peek LSP results in a popup without leaving the file | [DNLHC/glance.nvim](https://github.com/DNLHC/glance.nvim) |

## D. Editing — `lua/plugins/editing/`

| # | Name | Keymapping | What it does | GitHub repo |
|---|---|---|---|---|
| 32 | blink.cmp | `Enter` accept · `Tab` / `S-Tab` next / previous (or jump in a snippet) | Completion: LSP, paths, buffer words, own snippets (`snippets/*.json`), Copilot, dadbod SQL, lazydev | [saghen/blink.cmp](https://github.com/saghen/blink.cmp) |
| 33 | conform.nvim | `<leader>f` (normal / visual); also on save | Formatting: prettier, black, stylua, clang-format, goimports + gofmt, rustfmt, terraform fmt, shfmt, yamlfmt, sqlfluff | [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) |
| 34 | nvim-treesitter | — | Parsers for highlighting / indentation; installs a missing parser when a language is opened | [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) |
| 35 | nvim-ufo | `zr` open all · `zm` close all · `zk` peek fold | Code folding (LSP ranges, indentation fallback) | [kevinhwang91/nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) |
| 36 | nvim-autopairs | — | Closes brackets and quotes while typing | [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) |
| 37 | Built-in comments | `gcc` line · `gc` selection / motion | Toggle comments | Neovim built-in |
| 38 | ts-comments.nvim | — (improves `gc`) | Correct comment syntax in JSX/TSX/Vue (`{/* */}`) | [folke/ts-comments.nvim](https://github.com/folke/ts-comments.nvim) |
| 39 | Built-in autocmds (`config/autocmds.lua`) | — | Highlight on yank; reopen files at the last cursor position | Neovim built-in |

## E. Git — `lua/plugins/git/`

| # | Name | Keymapping | What it does | GitHub repo |
|---|---|---|---|---|
| 40 | gitsigns.nvim | `]c` / `[c` next / previous hunk · `<leader>gp` preview hunk · `<leader>gr` reset hunk · `<leader>gb` toggle inline blame | Read changes line by line; inline blame (off by default) | [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) |
| 41 | nvim-diff (local) | `<leader>gd` review changes · `<leader>gq` close · in the view `g?` help · shell: `nvim diff` | VS Code-style review: changed files (staged / unstaged / conflicts), side-by-side diff, stage / restore, whitespace toggle, live refresh, 3-way conflict tool | `~/Desktop/nvim-diff` |
| 42 | snacks.lazygit | `<leader>gg` | lazygit in a floating window: stage, commit, rebase, push (needs `lazygit`) | [folke/snacks.nvim](https://github.com/folke/snacks.nvim) |

## F. Languages — `lua/plugins/lang/`

| # | Name | Keymapping | What it does | GitHub repo |
|---|---|---|---|---|
| 43 | rustaceanvim | — (LSP keymaps) | Rust: rust-analyzer with clippy, runnables, macro expansion | [mrcjkb/rustaceanvim](https://github.com/mrcjkb/rustaceanvim) |
| 44 | nvim-lint | — (results in `<leader>xx`) | Linters that aren't LSPs: eslint_d, ruff, shellcheck, hadolint, tflint, markdownlint-cli2, sqlfluff | [mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint) |
| 45 | lazydev.nvim | — | Neovim Lua API completion and types when editing this config | [folke/lazydev.nvim](https://github.com/folke/lazydev.nvim) |
| 46 | SchemaStore.nvim | — | JSON/YAML schemas for jsonls/yamlls (package.json, tsconfig, GitHub Actions, compose, Chart.yaml) | [b0o/SchemaStore.nvim](https://github.com/b0o/SchemaStore.nvim) |
| 47 | live-preview.nvim | `:LivePreview start` / `:LivePreview close` | Live Markdown/HTML preview in the browser | [brianhuster/live-preview.nvim](https://github.com/brianhuster/live-preview.nvim) |
| 48 | package-info.nvim | — | Latest version shown next to each package.json dependency | [vuki656/package-info.nvim](https://github.com/vuki656/package-info.nvim) |

## G. Tools — `lua/plugins/tools/`

| # | Name | Keymapping | What it does | GitHub repo |
|---|---|---|---|---|
| 49 | snacks.terminal | `<leader>tt` · `<C-/>` (also inside the terminal) | Toggleable floating terminal (`<Esc><Esc>` normal mode, `q` hide) | [folke/snacks.nvim](https://github.com/folke/snacks.nvim) |
| 50 | lazydocker (in snacks.terminal) | `<leader>td` | Docker containers, images, logs (external binary) | [jesseduffield/lazydocker](https://github.com/jesseduffield/lazydocker) |
| 51 | k9s (in snacks.terminal) | `<leader>tk` | Kubernetes pods, logs, exec (external binary) | [derailed/k9s](https://github.com/derailed/k9s) |
| 52 | vim-dadbod | — | Database client layer (PostgreSQL, MySQL, SQLite, MongoDB, Redis...) | [tpope/vim-dadbod](https://github.com/tpope/vim-dadbod) |
| 53 | vim-dadbod-ui | `<leader>tb` | Database explorer and query runner | [kristijanhusak/vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui) |
| 54 | vim-dadbod-completion | — | Table / column completion in SQL buffers (blink.cmp source) | [kristijanhusak/vim-dadbod-completion](https://github.com/kristijanhusak/vim-dadbod-completion) |

## H. AI — `lua/plugins/ai/`

| # | Name | Keymapping | What it does | GitHub repo |
|---|---|---|---|---|
| 55 | copilot.lua | `:Copilot auth` (once) | GitHub Copilot client; disabled on Markdown | [zbirenbaum/copilot.lua](https://github.com/zbirenbaum/copilot.lua) |
| 56 | blink-copilot | — | Shows Copilot suggestions in the blink.cmp menu | [fang2hou/blink-copilot](https://github.com/fang2hou/blink-copilot) |

## I. Tools installed by Mason — list in `lua/plugins/core/mason.lua`

| # | Name | Keymapping | What it does | GitHub repo |
|---|---|---|---|---|
| 57 | basedpyright | — | Python language server | [DetachHead/basedpyright](https://github.com/DetachHead/basedpyright) |
| 58 | bash-language-server (bashls) | — | Shell language server | [bash-lsp/bash-language-server](https://github.com/bash-lsp/bash-language-server) |
| 59 | clangd | — | C language server (with clang-tidy) | [clangd/clangd](https://github.com/clangd/clangd) |
| 60 | css-lsp / html-lsp / json-lsp (cssls, html, jsonls) | — | CSS, HTML and JSON language servers | [hrsh7th/vscode-langservers-extracted](https://github.com/hrsh7th/vscode-langservers-extracted) |
| 61 | docker-compose-language-service | — | docker-compose language server | [microsoft/compose-language-service](https://github.com/microsoft/compose-language-service) |
| 62 | dockerfile-language-server (dockerls) | — | Dockerfile language server | [rcjsuen/dockerfile-language-server-nodejs](https://github.com/rcjsuen/dockerfile-language-server-nodejs) |
| 63 | gopls | — | Go language server (with staticcheck) | [golang/tools](https://github.com/golang/tools) |
| 64 | helm-ls | — | Helm language server | [mrjosh/helm-ls](https://github.com/mrjosh/helm-ls) |
| 65 | lua-language-server (lua_ls) | — | Lua language server | [LuaLS/lua-language-server](https://github.com/LuaLS/lua-language-server) |
| 66 | marksman | — | Markdown headings / links navigation | [artempyanykh/marksman](https://github.com/artempyanykh/marksman) |
| 67 | rust-analyzer | — | Rust language server (run by rustaceanvim) | [rust-lang/rust-analyzer](https://github.com/rust-lang/rust-analyzer) |
| 68 | sqls | — | SQL language server | [sqls-server/sqls](https://github.com/sqls-server/sqls) |
| 69 | tailwindcss-language-server | — | Tailwind class completion, hover, color swatches | [tailwindlabs/tailwindcss-intellisense](https://github.com/tailwindlabs/tailwindcss-intellisense) |
| 70 | terraform-ls (terraformls) | — | Terraform language server | [hashicorp/terraform-ls](https://github.com/hashicorp/terraform-ls) |
| 71 | vtsls | — | TypeScript / JavaScript language server (React, NestJS), inlay hints | [yioneko/vtsls](https://github.com/yioneko/vtsls) |
| 72 | yaml-language-server (yamlls) | — | YAML language server (SchemaStore + Kubernetes schemas) | [redhat-developer/yaml-language-server](https://github.com/redhat-developer/yaml-language-server) |
| 73 | eslint_d | — | JS/TS linter (only in projects with an ESLint config) | [mantoni/eslint_d.js](https://github.com/mantoni/eslint_d.js) |
| 74 | hadolint | — | Dockerfile linter | [hadolint/hadolint](https://github.com/hadolint/hadolint) |
| 75 | markdownlint-cli2 | — | Markdown linter | [DavidAnson/markdownlint-cli2](https://github.com/DavidAnson/markdownlint-cli2) |
| 76 | ruff | — | Python linter | [astral-sh/ruff](https://github.com/astral-sh/ruff) |
| 77 | shellcheck | — | Shell linter | [koalaman/shellcheck](https://github.com/koalaman/shellcheck) |
| 78 | sqlfluff | — | SQL linter and formatter (dialect: `vim.g.sqlfluff_dialect` unless the project has `.sqlfluff`) | [sqlfluff/sqlfluff](https://github.com/sqlfluff/sqlfluff) |
| 79 | tflint | — | Terraform linter | [terraform-linters/tflint](https://github.com/terraform-linters/tflint) |
| 80 | black | — | Python formatter | [psf/black](https://github.com/psf/black) |
| 81 | clang-format | — | C formatter | [llvm/llvm-project](https://github.com/llvm/llvm-project) |
| 82 | goimports | — | Go imports formatter | [golang/tools](https://github.com/golang/tools) |
| 83 | prettier | — | JS / TS / JSON / Markdown / CSS / HTML formatter | [prettier/prettier](https://github.com/prettier/prettier) |
| 84 | shfmt | — | Shell formatter | [mvdan/sh](https://github.com/mvdan/sh) |
| 85 | stylua | — | Lua formatter | [JohnnyMorganz/StyLua](https://github.com/JohnnyMorganz/StyLua) |
| 86 | yamlfmt | — | YAML formatter | [google/yamlfmt](https://github.com/google/yamlfmt) |
| 87 | jq | `:%!jq .` | Reformat / query large JSON | [jqlang/jq](https://github.com/jqlang/jq) |
| 88 | terraform | — | Provides `terraform fmt` | [hashicorp/terraform](https://github.com/hashicorp/terraform) |
| 89 | tree-sitter-cli | — | Builds the treesitter parsers | [tree-sitter/tree-sitter](https://github.com/tree-sitter/tree-sitter) |

## J. External binaries (install on the machine, see README.md)

| # | Name | Keymapping | What it does | GitHub repo |
|---|---|---|---|---|
| 90 | lazygit | `<leader>gg` | Git TUI used by snacks.lazygit | [jesseduffield/lazygit](https://github.com/jesseduffield/lazygit) |
| 91 | gofmt (Go toolchain) | — | Go formatter | [golang/go](https://github.com/golang/go) |
| 92 | rustfmt (Rust toolchain) | — | Rust formatter | [rust-lang/rustfmt](https://github.com/rust-lang/rustfmt) |
| 93 | ripgrep | `<leader>fg` `<leader>fc` | Search engine behind telescope live grep | [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep) |
| 94 | fd | `<leader>ff` | Faster file listing for telescope (optional) | [sharkdp/fd](https://github.com/sharkdp/fd) |
| 95 | Node.js | — | Runs Copilot, prettier, eslint_d and the JS-based servers | [nodejs/node](https://github.com/nodejs/node) |
| 96 | psql / mongosh / redis-cli / sqlite3 | `<leader>tb` | Database clients used by dadbod | — |

Libraries loaded automatically as dependencies: plenary.nvim, nui.nvim, nvim-web-devicons, promise-async.
