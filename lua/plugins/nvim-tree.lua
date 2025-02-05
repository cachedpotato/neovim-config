return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local tree = require("nvim-tree")
        tree.setup({
            view = {
                width = 30, -- explorer width
                relativenumber = true,
                side = "right",
                signcolumn = "no", -- looks weird on the right if set to yes
            },
            renderer = {
                indent_markers = { enable = true },
            },
            git = {
                ignore = false,
            },
        })
        local keymap = vim.keymap
        keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
        keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
        keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
        keymap.set("n", "<leader>ef", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file explorer" })
    end

}
