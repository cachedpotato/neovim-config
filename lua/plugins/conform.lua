return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true })
            end,
            mode = "",
            desc = "Format buffer"
        },
    },
    config = function()
        local conform = require("conform")
        conform.setup({
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },

            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                rust = { "rustfmt", lsp_format = "fallback" },
            },
        })
    end,
}
