return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        dim = {
            enabled = false,

            scope = {
                min_size = 5,
                max_size = 10,
                siblings = true,
            },
            -- animate scopes. Enabled by default for Neovim >= 0.10
            -- Works on older versions but has to trigger redraws during animation.
            animate = {
                enabled = true,
                easing = "outQuad",
                duration = {
                    step = 20,   -- ms per step
                    total = 300, -- maximum duration
                },
            },
            -- what bu
        },

        input = {
            enabled = true,
            icon = " ",
            icon_hl = "SnacksInputIcon",
            icon_pos = "left",
            prompt_pos = "title",
            win = { style = "input" },
            expand = true,
        },

        indent = {
            priority = 1,
            enabled = true,       -- enable indent guides
            char = "│",
            only_scope = false,   -- only show indent guides of the scope
            only_current = false, -- only show indent guides in the current window
            hl = "SnacksIndent", ---@type string|string[] hl groups for indent guides

            animate = {
                enabled = true,
                style = "out",
                easing = "linear",
                duration = {
                    step = 20,   -- ms per step
                    total = 500, -- maximum duration
                },
            },
            scope = {
                enabled = true, -- enable highlighting the current scope
                priority = 200,
                char = "│",
                underline = false,    -- underline the start of the scope
                only_current = false, -- only show scope in the current window
                hl = "SnacksIndentScope", ---@type string|string[] hl group for scopes
            },
        },

        -- Git utils
        -- [1] Blame line
        git = {
            enabled = true,
        },
        -- [2] Browse repo
        gitbrowse = {
            enabled = true,
        },

        -- [3] LazyGit
        lazygit = {
            enabled = true,
            win = {
                style = "lazygit",
            },
        },

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
        { "<leader>.",  function() Snacks.scratch() end,        desc = "Snacks Toggle Scratch Buffer" },
        { "<leader>S",  function() Snacks.scratch.select() end, desc = "Snacks Select Scratch Buffer" },
        { "<leader>gg", function() Snacks.lazygit() end,        desc = "Snacks LazyGit" },
        { "<leader>gb", function() Snacks.gitbrowse() end,      desc = "Snacks Git Browse Repo" },
        { "<leader>gB", function() Snacks.git.blame_line() end, desc = "Snacks Git Blame Line" },
        { "<leader>gl", function() Snacks.lazygit.log() end,    desc = "Snacks View LazyGit Log" },
    }
}
