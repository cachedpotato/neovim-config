return {
    "nvim-treesitter/nvim-treesitter",
    event = {"BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",

    },
    config = function ()
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
            auto_install = false,
            ignore_install = {},
            modules = {},
            sync_install = true,
        })
    end,
}
