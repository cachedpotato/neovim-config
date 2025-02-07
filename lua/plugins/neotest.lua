return {
    "nvim-neotest/neotest",
    event = "LspAttach",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",

        -- adapters
        "nvim-neotest/neotest-plenary",
    },

    config = function()
        local neotest = require("neotest")
        neotest.setup({
            adapters = {
                require("neotest-plenary"),
                require("rustaceanvim.neotest"),
                --require("neotest-rust"),
                --require("neotest-python"),
            },
            status = {
                virtual_text = true,
            }
        })
    end
}
