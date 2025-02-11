return {
    "mfussenegger/nvim-dap",
    event = "LspAttach",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        {
            "theHamsta/nvim-dap-virtual-text",
            opts = {},
        },
    },

    config = function()
        local dap = require("dap")
        -- setup codelldb
        dap.adapters.codelldb = {
            type = "executable",
            command = "codelldb",

            --detached = false,
        }
    end
}
