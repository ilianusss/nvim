-- SchemaStore: catalog of JSON / YAML schemas (package.json, tsconfig, GitHub Actions,
-- docker-compose, Chart.yaml...). Loaded by after/lsp/jsonls.lua and after/lsp/yamlls.lua.

return {
    "b0o/SchemaStore.nvim",
    lazy = true,
    version = false, -- the catalog is updated on every commit, there are no releases
}
