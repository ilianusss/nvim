# Neovim config

Requires Neovim 0.12+. Plugins, language servers, linters, formatters and treesitter parsers
install themselves on first launch: open `nvim` and wait for the installs to finish.

- `plugins-list.md`: every plugin and tool, with keymaps.

## Install on the machine

Mason installs everything else; these come from the system.

macOS:

```sh
xcode-select --install   # C compiler, make, git
brew install neovim ripgrep fd node python go rust lazygit lazydocker k9s
brew install postgresql mongosh redis   # only the database clients you use
```

Linux (Debian/Ubuntu; the distro Neovim is often too old, use the official release):

```sh
sudo apt install build-essential git curl unzip tar ripgrep fd-find \
  nodejs npm python3-venv golang rustc wl-clipboard   # xclip instead on X11
sudo apt install postgresql-client redis-tools        # database clients you use
# lazygit, lazydocker, k9s, mongosh: install from their GitHub releases
```

| Tool                         | Needed for                                                        |
|------------------------------|-------------------------------------------------------------------|
| C compiler, make, curl, tar  | treesitter parsers, telescope-fzf-native                          |
| Node.js + npm                | Copilot, prettier, eslint_d, JS-based language servers            |
| python3 (+ venv)             | basedpyright, black, clang-format, sqlfluff                       |
| Go                           | gopls, goimports, `gofmt`                                         |
| Rust toolchain               | `rustfmt` (rust-analyzer comes from Mason)                        |
| ripgrep, fd                  | telescope live grep (`<leader>fg`), faster file search            |
| lazygit, lazydocker, k9s     | `<leader>gg`, `<leader>td`, `<leader>tk`                          |
| psql, mongosh, redis-cli...  | databases in dadbod (`<leader>tb`)                                |
| wl-clipboard / xclip         | system clipboard on Linux                                         |
| a Nerd Font                  | icons                                                             |

After the first launch: `:Copilot auth` (needs a GitHub Copilot subscription), then
`:checkhealth`.
