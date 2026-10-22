-- Every keymap of this config lives in this file, so they can all be remapped in one place.
-- Plugin specs never define keys: these mappings call a plugin command or `require()` a plugin
-- module, and lazy.nvim loads the plugin on first use. Always set `desc` (which-key shows it).

local M = {}
local map = vim.keymap.set

-- which-key labels for the <leader> prefixes used below
M.groups = {
    { "<leader>c", group = "code" },
    { "<leader>f", group = "find / format" },
    { "<leader>g", group = "git" },
    { "<leader>p", group = "peek" },
    { "<leader>q", group = "buffers / session" },
    { "<leader>r", group = "rename / restart" },
    { "<leader>t", group = "tools / toggles" },
    { "<leader>x", group = "trouble" },
}

-- Completion menu keys, read by plugins/editing/completion.lua (see :h blink-cmp-config-keymap)
M.completion = {
    preset = "enter",
    ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
    ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
}

-- General
map("n", "<leader><leader>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Windows
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Comments are built into Neovim (ts-comments fixes the syntax in JSX/TSX/Vue)
--  gcc        : toggle comment for the current line
--  gc         : toggle comment for a visual selection
--  gc{motion} : comment using a motion (e.g., gc3j, gc})

-- Buffers (bufferline)
map("n", "<A-Left>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
map("n", "<A-Right>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
map("n", "<A-s>", "<cmd>BufferLineSortByDirectory<CR>", { desc = "Sort tabs by directory" })
map("n", "<leader>qp", "<cmd>BufferLinePickClose<CR>", { desc = "Close picked buffer" })
map("n", "<leader>qa", "<cmd>BufferLineCloseOthers<CR>", { desc = "Close all except current buffer" })

-- Sessions (persistence)
map("n", "<leader>qs", function()
    require("persistence").load()
end, { desc = "Restore session for this folder" })
map("n", "<leader>ql", function()
    require("persistence").load({ last = true })
end, { desc = "Restore last session" })
map("n", "<leader>qd", function()
    require("persistence").stop()
end, { desc = "Don't save this session on exit" })

-- File explorer (nvim-tree)
map("n", "<leader>E", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file explorer" })
map("n", "<leader>w", "<cmd>NvimTreeFindFile<CR>", { desc = "Find buffer in file explorer" })

-- Find (telescope, todo-comments)
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Find string in cwd" })
map("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "Find string under cursor in cwd" })
map("n", "<leader>fp", "<cmd>Telescope project<CR>", { desc = "Find projects" })
map("n", "<leader>fu", "<cmd>Telescope undo<CR>", { desc = "Undo history" })
map("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find todos" })

-- Format (conform)
map({ "n", "v" }, "<leader>f", function()
    require("conform").format()
end, { desc = "Format file or range (in visual mode)" })

-- Jump (flash)
-- stylua: ignore start
map({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
map({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
map("o", "r", function() require("flash").remote() end, { desc = "Remote Flash" })
map({ "o", "x" }, "R", function() require("flash").treesitter_search() end, { desc = "Treesitter Search" })
map("c", "<C-s>", function() require("flash").toggle() end, { desc = "Toggle Flash Search" })
-- stylua: ignore end

-- Folds (ufo)
map("n", "zr", function()
    require("ufo").openAllFolds()
end, { desc = "Open all folds" })
map("n", "zm", function()
    require("ufo").closeAllFolds()
end, { desc = "Close all folds" })
map("n", "zk", function()
    if not require("ufo").peekFoldedLinesUnderCursor() then
        vim.lsp.buf.hover()
    end
end, { desc = "Peek fold" })

-- Diagnostics panels (trouble), outline (aerial), peek (glance)
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (all files)" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Diagnostics (buffer)" })
map("n", "<leader>xt", "<cmd>Trouble todo toggle<CR>", { desc = "Todos" })
map("n", "<leader>xq", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix list" })
map("n", "<leader>xl", "<cmd>Trouble loclist toggle<CR>", { desc = "Location list" })
map("n", "<leader>o", "<cmd>AerialToggle<CR>", { desc = "Symbols outline" })
map("n", "<leader>pd", "<cmd>Glance definitions<CR>", { desc = "Peek definitions" })
map("n", "<leader>pr", "<cmd>Glance references<CR>", { desc = "Peek references" })
map("n", "<leader>pi", "<cmd>Glance implementations<CR>", { desc = "Peek implementations" })
map("n", "<leader>pt", "<cmd>Glance type_definitions<CR>", { desc = "Peek type definitions" })

-- Git: hunks and blame (gitsigns). ]c / [c keep their diff-mode meaning inside diffs.
map("n", "]c", function()
    if vim.wo.diff then
        vim.cmd.normal({ "]c", bang = true })
    else
        require("gitsigns").nav_hunk("next")
    end
end, { desc = "Next git hunk" })
map("n", "[c", function()
    if vim.wo.diff then
        vim.cmd.normal({ "[c", bang = true })
    else
        require("gitsigns").nav_hunk("prev")
    end
end, { desc = "Previous git hunk" })
map("n", "<leader>gp", function()
    require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })
map("n", "<leader>gr", function()
    require("gitsigns").reset_hunk()
end, { desc = "Reset hunk" })
map("n", "<leader>gb", function()
    require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle inline blame" })

-- Git: review changes (telescope git pickers, diffview)
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Modified files (git status)" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Commits" })
map("n", "<leader>gf", "<cmd>Telescope git_bcommits<CR>", { desc = "Commits of current file" })
map("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Diff all modified files" })
map("n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", { desc = "File history (diffview)" })
map("n", "<leader>gq", "<cmd>DiffviewClose<CR>", { desc = "Close diffview" })

-- Tools: floating terminals (snacks) and database UI (dadbod)
local function float_tool(cmd)
    return function()
        if vim.fn.executable(cmd) == 0 then
            vim.notify(cmd .. " is not installed (see README.md)", vim.log.levels.WARN)
        elseif cmd == "lazygit" then
            Snacks.lazygit()
        else
            Snacks.terminal.toggle(cmd)
        end
    end
end

map("n", "<leader>gg", float_tool("lazygit"), { desc = "Lazygit" })
map("n", "<leader>td", float_tool("lazydocker"), { desc = "Lazydocker" })
map("n", "<leader>tk", float_tool("k9s"), { desc = "k9s (Kubernetes)" })
map("n", "<leader>tt", function()
    Snacks.terminal.toggle()
end, { desc = "Toggle terminal" })
map({ "n", "t" }, "<C-/>", function()
    Snacks.terminal.toggle()
end, { desc = "Toggle terminal" })
map({ "n", "t" }, "<C-_>", function() -- what some terminals send for <C-/>
    Snacks.terminal.toggle()
end, { desc = "which_key_ignore" })
map("n", "<leader>tb", "<cmd>DBUIToggle<CR>", { desc = "Database UI" })
map("n", "<leader>tw", function()
    if Snacks.dim.enabled then
        Snacks.dim.disable()
    else
        Snacks.dim.enable()
    end
end, { desc = "Toggle dim (focus on current scope)" })

-- LSP: buffer-local, set when a language server attaches
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("user_lsp_keymaps", { clear = true }),
    callback = function(ev)
        local function lsp_map(lhs, rhs, desc)
            map("n", lhs, rhs, { buffer = ev.buf, desc = desc })
        end

        lsp_map("gR", "<cmd>Telescope lsp_references<CR>", "Show LSP references")
        lsp_map("gD", vim.lsp.buf.declaration, "Go to declaration")
        lsp_map("gd", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions")
        lsp_map("gi", "<cmd>Telescope lsp_implementations<CR>", "Show LSP implementations")
        lsp_map("gt", "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions")
        lsp_map("<leader>ca", vim.lsp.buf.code_action, "Code actions")
        lsp_map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        lsp_map("<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Buffer diagnostics")
        lsp_map("K", vim.lsp.buf.hover, "Documentation hover")
        lsp_map("<leader>rs", "<cmd>lsp restart<CR>", "Restart LSP")
    end,
})

return M
