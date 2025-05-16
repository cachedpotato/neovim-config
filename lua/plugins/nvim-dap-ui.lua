return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "nvim-neotest/nvim-nio",
        {
            "theHamsta/nvim-dap-virtual-text",
            opts = {}
        },
    },
    opts = function()
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup()
    end,

    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        -- use nvim-dap events to open/close windows automatically
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
    end,

    keys = {
        { "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI Toggle" },
        { "<leader>de", function() require("dapui").eval() end,     desc = "Dap UI Eval",  mode = { "n", "v" } },
    }


}
