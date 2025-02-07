return {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    config = function()
        local keymap = vim.keymap
        local cmd = vim.cmd
        vim.g.rustaceanvim = {
            server = {
                tools = {
                    -- why isn't this loading automatically?
                    test_executor = require('rustaceanvim.executors').neotest
                },
                on_attach = function()
                    local bufnr = vim.api.nvim_get_current_buf()
                    --keymaps
                    keymap.set("n", "<leader>rt", function()
                            cmd.RustLsp({ 'testables', '--show-output' })
                        end,
                        { desc = "rustaceanvim see testables", silent = true, buffer = bufnr }
                    )
                    keymap.set("n", "<leader>re", function()
                            cmd.RustLsp({ 'explainError', 'current' })
                        end,
                        { desc = "rustaceanvim explain current error", silent = true, buffer = bufnr }
                    )
                    keymap.set("n", "<leader>rd", function()
                            cmd.RustLsp({ 'renderDiagnostic', 'current' })
                        end,
                        { desc = "rustaceanvim get current diagnostic", silent = true, buffer = bufnr }
                    )
                    keymap.set("n", "<leader>rr", function()
                            cmd.RustLsp('relatedDiagnostic')
                        end,
                        { desc = "rustaceanvim jump to related diagnostic", silent = true, buffer = bufnr }
                    )

                    -- run command twice to activate hover actions
                    -- accepts count prefix
                    -- ex) "3<leader>a" to invokde third action
                    keymap.set("n", "<leader>ra", function()
                            cmd.RustLsp({ 'hover', 'actions' })
                        end,
                        { desc = 'rustaceanvim hover actions', silent = true, buffer = bufnr }
                    )

                    -- debug
                    -- maybe after I set nvim-dap but don't feel the need to rn
                    --keymap.set("n", "<leader>rd", cmd.RustLsp('debuggables'), { desc = "rustaceanvim see debuggables" })
                end,

                default_settings = {
                    ["rust-analyzer"] = {
                        cargo = {
                            allFeatures = true,
                        },
                    },
                }
            }
        }
    end,
}
