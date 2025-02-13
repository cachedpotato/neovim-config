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
                    keymap.set("n", "<leader>ru", function()
                            cmd.RustLsp({ 'run' })
                        end,
                        { desc = "rustaceanvim run", silent = true, buffer = bufnr }
                    )
                    keymap.set("n", "<leader>rR", function()
                            cmd.RustLsp({ 'runnables' })
                        end,
                        { desc = "rustaceanvim see runnables", silent = true, buffer = bufnr }
                    )
                    keymap.set("n", "<leader>r!", function()
                            cmd.RustLsp({ 'runnables', bang = true })
                        end,
                        { desc = "rustaceanvim run previous", silent = true, buffer = bufnr }
                    )
                    keymap.set("n", "<leader>rt", function()
                            cmd.RustLsp({ 'testables' })
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
                            cmd.RustLsp('relatedDiagnostics')
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

                    keymap.set("n", "<leader>rD", cmd.RustLsp('debuggables'),
                        { desc = "rustaceanvim see debuggables", silent = true, buffer = bufnr })

                    keymap.set("n", "<leader>rO", cmd.RustLsp('openDocs'),
                        { desc = "rustaceanvim open docs.rs documentation", silent = true, buffer = bufnr })
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
