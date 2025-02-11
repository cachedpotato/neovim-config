return {
    "j-hui/fidget.nvim",

    opts = function()
        local fidget = require("fidget")
        local notif = require("fidget.notification")
        notif.default_config.icon_on_left = true
        fidget.setup({
            enable = false,
            progress = {
                display = {
                    render_limit = 10,
                    done_icon = "✓",
                    progress_icon = { "dots" },
                    overrides = {
                        rust_analyzer = { name = "rust-analyzer" },
                    },
                },
            },

            notification = {
                poll_rate = 10,
                view = {
                    stack_upwards = true,
                    render_message =
                        function(msg, cnt)
                            local short = string.len(msg) > 30 and string.sub(msg, 1, 30) .. "..." or msg
                            return cnt == 1 and short or string.format("(%dx) %s", cnt, short)
                        end,
                },
                window = {
                    winblend = 100,
                },
            },

            integration = {
                ["nvim-tree"] = {
                    enable = true,
                }
            },
        })
    end,
}
