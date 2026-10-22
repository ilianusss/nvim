-- Editor options

-- Leader keys must be set before lazy.nvim loads (plugin `keys` use them)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.number = true -- Show line numbers
opt.relativenumber = true -- Relative line numbers
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 4 -- Shift 4 spaces when tab
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.smartindent = true -- Smart indentation
opt.wrap = false -- No line wrapping
opt.cursorline = true -- Highlight current line
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.clipboard = "unnamedplus" -- System clipboard (Linux needs wl-clipboard or xclip)
opt.splitright = true -- Vertical splits to the right
opt.splitbelow = true -- Horizontal splits below
opt.signcolumn = "yes" -- Always show the sign column (no text shift on diagnostics)
opt.ignorecase = true -- Case-insensitive search...
opt.smartcase = true -- ...unless the pattern has a capital letter
opt.undofile = true -- Persist undo history across sessions
opt.updatetime = 250 -- Faster CursorHold (LSP reference highlight)

-- SQL dialect for sqlfluff (lint + format) in projects without a .sqlfluff file
vim.g.sqlfluff_dialect = "ansi"
