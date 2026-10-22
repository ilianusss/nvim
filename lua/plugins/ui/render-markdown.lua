-- render-markdown: renders Markdown headings, tables, checkboxes and code blocks inside the
-- buffer; the line under the cursor is shown raw so it can be edited

return {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        latex = { enabled = false }, -- needs a latex parser + converter, not used here
    },
}
