-- Merged on top of nvim-lspconfig's defaults for yamlls
return {
    settings = {
        yaml = {
            -- Schemas come from SchemaStore.nvim (GitHub Actions, docker-compose, Chart.yaml...)
            -- instead of being downloaded by yamlls itself
            schemaStore = { enable = false, url = "" },
            schemas = vim.tbl_extend("force", require("schemastore").yaml.schemas(), {
                -- Kubernetes schema (bundled with yamlls) for manifests in these folders or named *.k8s.yaml
                kubernetes = {
                    "**/k8s/**/*.{yml,yaml}",
                    "**/kubernetes/**/*.{yml,yaml}",
                    "**/manifests/**/*.{yml,yaml}",
                    "*.k8s.{yml,yaml}",
                },
            }),
        },
    },
}
