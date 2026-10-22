-- nvim-diff: VS Code-style review of the repo's changes — changed files on the left (staged /
-- unstaged / conflicts), side-by-side diff, stage / restore, whitespace toggle, live refresh,
-- 3-way conflict tool. `nvim diff` in a shell opens it.
-- Not lazy-loaded: `nvim diff` needs its startup hook; the plugin loads its modules on demand.

return {
    "ilianusss/nvim-diff",
    version = "*", -- latest release tag
    lazy = false,
    opts = {},
}
