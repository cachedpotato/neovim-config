return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim",                   opts = {} },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local capabilities = cmp_nvim_lsp.default_capabilities()

        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = 'E ',
                    [vim.diagnostic.severity.WARN] = 'W ',
                    [vim.diagnostic.severity.HINT] = 'H ',
                    [vim.diagnostic.severity.INFO] = 'I ',
                }
            },
        })
        mason_lspconfig.setup_handlers({
            --default setup function for installed servers
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end,

            ["rust_analyzer"] = function() end,
        })
    end,
}
