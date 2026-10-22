-- Extra filetype rules (see :h vim.filetype.add). The compound `yaml.*` filetypes keep YAML
-- highlighting while letting the matching language server attach.

local function in_helm_chart(path)
    return vim.fs.root(path, "Chart.yaml") ~= nil
end

vim.filetype.add({
    filename = {
        ["docker-compose.yml"] = "yaml.docker-compose",
        ["docker-compose.yaml"] = "yaml.docker-compose",
        ["compose.yml"] = "yaml.docker-compose",
        ["compose.yaml"] = "yaml.docker-compose",
    },
    pattern = {
        -- docker-compose.override.yml, compose.prod.yaml...
        ["docker%-compose%..+%.ya?ml"] = "yaml.docker-compose",
        ["compose%..+%.ya?ml"] = "yaml.docker-compose",
        -- Helm templates: handled by helm_ls, so yamlls doesn't flag the {{ }} syntax
        [".*/templates/.*%.ya?ml"] = function(path)
            return in_helm_chart(path) and "helm" or nil
        end,
        [".*/templates/.*%.tpl"] = function(path)
            return in_helm_chart(path) and "helm" or nil
        end,
        -- Helm values: yamlls (YAML checks) + helm_ls (values used by the templates)
        [".*/values.*%.ya?ml"] = function(path)
            return in_helm_chart(path) and "yaml.helm-values" or nil
        end,
    },
})
