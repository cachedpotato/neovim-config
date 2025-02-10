return {
    "j-hui/fidget.nvim",

    opts = function()
        local fidget = require("fidget")
        local notif = require("fidget.notification")
        notif.default_config.icon_on_left = true
        fidget.setup({
            progress = {
                display = {
                    render_limit = 10,
                    done_icon = "✓", --"✔"
                    progress_icon = { "dots" },
                },
            },
            notification = {
                configs = {
                    default = notif.default_config,
                }
            }
        })
    end,
}
