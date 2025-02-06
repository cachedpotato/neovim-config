return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
        "nvim-treesitter/nvim-treesitter-refactor",
        "nvim-treesitter/nvim-treesitter-context",
    },
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "c",
                "lua",
                "vim",
                "rust",
                "python",
                "r"
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    node_decremental = "<bs>",
                    scope_incremental = false,
                },
            },
            refactor = {
                highlight_definitions = {
                    enable = true,
                    clear_on_cursor_move = true,
                },
                navivation = {
                    enable = true,
                    keymaps = {
                        goto_definition = "<M-*>",
                        goto_next_usage = "<M->>",
                        goto_previous_usage = "<M-<>"
                    }
                }
            },
            auto_install = false,
            ignore_install = {},
            modules = {},
            sync_install = true,
        })
    end,
}
