return {
    "quarto-dev/quarto-nvim",
    dependencies = {
        "jmbuhr/otter.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        local quarto = require("quarto")
        quarto.setup({
            lspFeatures = {
                languages = { "r", "python", "rust" },
                chunks = "all",
                diagnostics = {
                    enabled = true,
                    triggers = { "BufWritePost" },
                },
                completion = {
                    enabled = true,
                }
            },
            keymap = {
                hover = "K",
                definition = "gd",
                references = "gr",
                rename = "<leader>rn",
                format = "<leader>format",
            },
            codeRunner = {
                enabled = true,
                default_method = "molten"
            }
        })
    end
}
