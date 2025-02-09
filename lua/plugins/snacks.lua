return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        dim = { enabled = false, },

        notifier = {
            enabled = true,
            timeout = 2500,
            width = { min = 40, max = 0.4 },
            height = { min = 1, max = 0.6 },
            margin = {
                top = 0,
                right = 1,
                bottom = 1,
            },
            padding = true,
            sort = { "level", "added" },
            icons = {
                error = " ",
                warn = " ",
                info = " ",
                debug = " ",
                trace = " ",
            },
            keep = function()
                return vim.fn.getcmdpos() > 0
            end,
            style = "compact",
            top_down = true,
            date_format = "%R",
            refresh = 50 --refresh at most every 50ms
        },

        rename = {
            enabled = true,
        },

        scratch = {
            enabled = true,
        },
        -- styling for stuff
        -- styles = {},
    },

    keys = {
        {
            "<leader>di",
            function()
                if Snacks.dim.enabled == false then
                    Snacks.dim.enable()
                    Snacks.dim()
                else
                    Snacks.dim.disable()
                end
            end,
            desc = "Snacks Toggle Dim"
        },
        { "<leader>.", function() Snacks.scratch() end,        desc = "Snacks Toggle Scratch Buffer" },
        { "<leader>S", function() Snacks.scratch.select() end, desc = "Snacks Select Scratch Buffer" },
    }
}
