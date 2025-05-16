return {
    "3rd/image.nvim",
    opt = function()
        local image = require("image")
        image.setup({
            backend = "kitty",
            integrations = {},
            max_width = 200,
            max_height = 200,
            max_height_window_percentage = math.huge,
            max_width_window_percentage = math.huge,
            window_overlap_clear_enabled = true,
            window_overlap_clear_ft_ignore = {
                "cmp_menu",
                "cmp_docs",
                "",
            }
        })
    end,
}
