return {
    "benlubas/molten-nvim",
    version = "^1.0.0",
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
        vim.g.molten_image_provider = "image.nvim"
        vim.g.molten_auto_open_output = true
        vim.g.molten_wrap_output = true
        vim.g.molten_virt_text_output = true
        vim.g.virt_lines_off_by_1 = true
    end,
    config = function()
        local keymap = vim.keymap
        local runner = require("quarto.runner")
        keymap.set("n", "<leader>me", ":MoltenEvaluatgeOperator<CR>",
            { desc = "Molten Evaluate Operator", silent = true })
        keymap.set("n", "<leader>mo", ":MoltenEnterOutput<CR>", { desc = "Molten Open Output Window", silent = true })
        keymap.set("n", "<leader>mr", ":MoltenReevaluateCell<CR>", { desc = "Molten Reevaluate Cell", silent = true })
        keymap.set("n", "<leader>mR", ":<C-u>MoltenEvaluateVisual<CR>gv",
            { desc = "Molten Evaluate Visual", silent = true })
        keymap.set("n", "<leader>mh", ":MoltenHideOutput<CR>", { desc = "Molten Hide Output", silent = true })
        keymap.set("n", "<leader>md", ":MoltenDelete<CR>", { desc = "Molten Delete Cell", silent = true })

        -- Quarto
        keymap.set("n", "<leader>qc", runner.run_cell, { desc = "Quarto Run Cell" })
        keymap.set("n", "<leader>qa", runner.run_above, { desc = "Quarto Run Above" })
        keymap.set("n", "<leader>qA", function()
            runner.run_all(true)
        end, { desc = "Quarto Run All" })
        keymap.set("n", "<leader>ql", runner.run_line, { desc = "Quarto Run Line" })
        keymap.set("n", "<leader>qr", runner.run_range, { desc = "Quarto Run Range" })
    end
}
