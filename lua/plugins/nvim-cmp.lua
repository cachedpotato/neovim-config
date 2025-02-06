return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "onsails/lspkind.nvim",         -- vscode like pictograms
        "saadparwaiz1/cmp_luasnip",     -- for autocompletion
        "rafamadriz/friendly-snippets", -- useful snippets
        {
            "L3MON4D3/LuaSnip",
            tag = "v2.3.0",
            build = "make install_jsregexp"
        },
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")
        local WIDE_HEIGHT = 20
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            --preselect = 'None', -- don't select anything upon load
            completion = {
                completeopt = "menu, menuone, preview, noselect",
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<M-j>'] = cmp.mapping.select_next_item(),
                ['<M-k>'] = cmp.mapping.select_prev_item(),
                ['<M-h>'] = cmp.mapping.scroll_docs(-4),
                ['<M-l>'] = cmp.mapping.scroll_docs(4),
                ['<M-Space>'] = cmp.mapping.complete(), --show completion suggestions
                ['<M-e>'] = cmp.mapping.abort(),
                -- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ['<CR>'] = cmp.mapping(function(fallback)
                    if cmp.get_active_entry() then
                        cmp.confirm({ select = true })
                    else
                        fallback()
                    end
                end, { "i", "c" })
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" }, -- snippets
                { name = "buffer" },  -- text within current buffer
                { name = "path" },    -- filesystem paths
            }),

            formatting = {
                format = lspkind.cmp_format({
                    maxwidth = {
                        menu = 20, -- leading text
                        abbr = 20, -- actual suggestion item
                    },
                    ellipsis_char = "...",
                    show_labelDetails = true -- default false
                }),
                expandable_indicator = true,
                fields = { cmp.ItemField.Abbr, cmp.ItemField.Kind },
                window = {
                    documentation = {
                        max_height = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines)),
                        max_width = math.floor((WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))),
                    }
                }
            },
        })
    end,
}
