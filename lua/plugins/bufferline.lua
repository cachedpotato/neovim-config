return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        local bufferline = require("bufferline")
        local keymap = vim.keymap
        bufferline.setup({
            --keymaps
            keymap.set("n", "<leader><tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "move to next buffer" }),
            keymap.set("n", "<leader>bc", "<cmd>BufferLineCloseOthers<CR>", { desc = "close left buffer" }),
            keymap.set("n", "<leader>bcl", "<cmd>BufferLineCloseRight<CR>", { desc = "close right buffer" }),
            keymap.set("n", "<leader>bch", "<cmd>BufferLineCloseRight<CR>", { desc = "close right buffer" }),
        })
    end,
}
