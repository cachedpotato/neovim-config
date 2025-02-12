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
        local keymap = vim.keymap

        -- set hlgroups
        local severity = { "Error", "Warn", "Info", "Hint" }
        local utils = require("config.utils")

        for _, sev in ipairs(severity) do
            utils.create_hl_group(sev)
        end

        -- signcolumn config
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = '', --'', asdasd
                    [vim.diagnostic.severity.WARN] = '',  --'',
                    [vim.diagnostic.severity.HINT] = '',  --'󰠠',
                    [vim.diagnostic.severity.INFO] = '',  --'',
                },
                linehl = {
                    [vim.diagnostic.severity.ERROR] = 'DiagnosticErrorLn',
                    [vim.diagnostic.severity.WARN] = 'DiagnosticWarnLn',
                    [vim.diagnostic.severity.HINT] = 'DiagnosticHintLn',
                    [vim.diagnostic.severity.INFO] = 'DiagnosticInfoLn',
                },
                numhl = {
                    [vim.diagnostic.severity.ERROR] = 'DiagnosticError',
                    [vim.diagnostic.severity.WARN] = 'DiagnosticWarn',
                    [vim.diagnostic.severity.HINT] = 'DiagnosticHint',
                    [vim.diagnostic.severity.INFO] = 'DiagnosticInfo',
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

            ["lua_ls"] = function()
                lspconfig["lua_ls"].setup({
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                            hint = {
                                enable = true,
                            },
                        },
                    },
                })
            end,
        })

        -- inlay hint option
        -- why the fuck does the inlay_hint plugin not work oh my fucking god
        vim.lsp.inlay_hint.enable(true)

        -- LSP keymaps
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true, }

                opts.desc = "Go to declaration"
                keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

                opts.desc = "Go to type definition"
                keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)

                opts.desc = "Go to definition"
                keymap.set("n", "gd", vim.lsp.buf.definition, opts)

                opts.desc = "Show buffer diagnostics"
                keymap.set("n", "sD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

                opts.desc = "Show line diagnostic"
                keymap.set("n", "sd", vim.diagnostic.open_float, opts)

                opts.desc = "Show next diagnostic"
                keymap.set("n", "<leader>]d", vim.diagnostic.open_float, opts)

                opts.desc = "Show previous diagnostic"
                keymap.set("n", "<leader>[d", vim.diagnostic.open_float, opts)
            end,
        })
    end,
}
