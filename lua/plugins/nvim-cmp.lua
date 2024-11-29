return {
    "hrsh7th/nvim-cmp",
    config = function()
        local cmp = require("cmp")
        cmp.setup({
            sources = {
                { name = "nvim_lsp", priority = 800 },
                { name = "buffer", priority = 100 },
                { name = "path", priority = 1000 },
            },
            window = {
                completion = cmp.config.window.bordered({
                    border = 'rounded',
                }),
                documentation = cmp.config.window.bordered({
                    border = 'rounded',
                }),
            },
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end
            },
            preselect = cmp.PreselectMode.None,
            mapping = {
                ["<CR>"] = function(fallback)
                    if cmp.visible() then
                        cmp.confirm({ select = false })
                    else
                        fallback()
                    end
                end,
                ["<Tab>"] = function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                    else
                        fallback()
                    end
                end,
                ["<S-Tab>"] = function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                    else
                        fallback()
                    end
                end,
            }
        })
    end
}
