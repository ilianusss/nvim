# Themes

This folder is added to Neovim's runtimepath (path set by `themes_dir` in
`lua/config/colorscheme.lua`; change that one line to move the folder, e.g. into a dotfiles repo).

```
themes/
  colors/<name>.lua   a colorscheme: `:colorscheme <name>` works as soon as the file exists
  colors/theme.lua    the shared palette picked with the `theme` shell command (~/.theme)
  lua/<module>.lua    shared Lua modules, e.g. lua/theme/palette.lua -> require("theme.palette")
  lua/lualine/themes/<name>.lua   statusline colors; lualine's "auto" picks the one named like the colorscheme
```

## The shared theme (`~/.theme`)

Colors are chosen once for the terminal, the shell and Neovim with the `theme` shell command
(`theme` opens a picker; docs in `~/.theme/AGENTS.md`). In Neovim:

- startup runs `:colorscheme theme` (`colors/theme.lua`), which reads
  `~/.theme/current/colors/palette` through `require("theme.palette").read()`;
- a palette with `nvim_colorscheme=<name>` uses that colorscheme (it must be on the runtimepath,
  so plugin colorschemes are `lazy = false`); otherwise mini.base16 builds one from `base00..base0F`;
- every open Neovim re-applies it when `theme` switches (a watcher on `~/.theme/generated/`);
- `:colorscheme <other>` to try something else, `:colorscheme theme` to go back.

## Your own colorscheme

Minimal theme, `colors/example.lua`:

```lua
vim.cmd.highlight("clear")
vim.g.colors_name = "example"
vim.api.nvim_set_hl(0, "Normal", { fg = "#d4be98", bg = "#1d2021" })
```

To make it the default everywhere, point a `~/.theme` palette at it with
`nvim_colorscheme=example`, or read the shared colors from it:

```lua
local p = require("theme.palette").read() -- { base00 = "#282828", ..., color1 = ..., variant = "dark" }
```
