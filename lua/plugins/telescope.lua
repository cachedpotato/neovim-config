return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
        }
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")
        local keymap = vim.keymap
        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        -- escape telescope in insert mode
                        ["<esc>"] = actions.close,
                        ["<M-j>"] = actions.move_selection_next,
                        ["<M-k>"] = actions.move_selection_previous,
                        ["<M-h>"] = actions.preview_scrolling_up,
                        ["<M-l>"] = actions.preview_scrolling_down,
                    },
                },
            },

            extensions = {
                fzf = {
                    fuzzy = true,                   -- only do exact matching
                    override_generic_sorter = true, -- override generic sorter
                    override_file_sorter = true,    -- override file sorter
                    case_mode = "smart_case",       -- default, other options: ignore_case, respect_case
                }
            }
        })

        -- load extensions
        telescope.load_extension("fzf")

        -- keymaps for Telescope
        keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
        keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
        keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "Telescope grep string" })
        keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
        keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope find files" })
    end
}
