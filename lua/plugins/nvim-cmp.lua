return {
    "hrsh7th/nvim-cmp",
    config = function()
        local cmp = require("cmp")
        cmp.setup({
            sources = {
                {
                    name = "nvim_lsp",
                    priority = 800,
                    -- get rid of snippet
                    entry_filter = function(entry, _)
                        return cmp.lsp.CompletionItemKind.Snippet ~= entry:get_kind()
                    end
                },
                { name = "buffer", priority = 100 },
                { name = "path",   priority = 1000 },
            },
            window = {
                completion = cmp.config.window.bordered({
                    border = 'rounded',
                    scrollbar = true,
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
            formatting = {
                format = function(_, vim_item)
                    vim_item.abbr = string.sub(vim_item.abbr, 1, 20)
                    return vim_item
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
