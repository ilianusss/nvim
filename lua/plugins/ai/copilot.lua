-- copilot.lua + blink-copilot: GitHub Copilot suggestions shown as items of the blink.cmp
-- completion menu. Needs a Copilot subscription and Node.js; sign in once with :Copilot auth.
-- To get ghost-text suggestions instead: set suggestion.enabled = true and delete the
-- blink.cmp block below.

return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        opts = {
            suggestion = { enabled = false },
            panel = { enabled = false },
            filetypes = {
                markdown = false, -- CLAUDE.md, READMEs, plans
                yaml = true, -- off by default in copilot.lua; needed for k8s / compose / CI files
            },
        },
    },
    {
        "saghen/blink.cmp",
        dependencies = { "fang2hou/blink-copilot" },
        opts = {
            sources = {
                default = { "copilot" },
                providers = {
                    copilot = {
                        name = "copilot",
                        module = "blink-copilot",
                        score_offset = 100,
                        async = true,
                    },
                },
            },
        },
    },
}
