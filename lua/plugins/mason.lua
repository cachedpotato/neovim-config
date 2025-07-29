return {
    --"williamboman/mason.nvim",
    "mason-org/mason.nvim",
    dependencies = {
        "mason-org/mason-lspconfig.nvim"
    },
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    }


}
