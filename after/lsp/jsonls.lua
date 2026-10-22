-- Merged on top of nvim-lspconfig's defaults for jsonls
-- Validates package.json, tsconfig.json... against SchemaStore (plugins/lang/schemastore.lua)
return {
    settings = {
        json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
        },
    },
}
