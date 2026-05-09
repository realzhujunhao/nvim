vim.pack.add({
    { src = 'https://github.com/mason-org/mason.nvim' },
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/hrsh7th/cmp-nvim-lsp' },
    { src = 'https://github.com/hrsh7th/cmp-path' },
    { src = 'https://github.com/hrsh7th/nvim-cmp' },
    { src = 'https://github.com/stevearc/conform.nvim' },
    { src = 'https://github.com/mfussenegger/nvim-lint' },
})

require('mason').setup()

local cmp = require('cmp')
cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'path' }
    },
    preselect = cmp.PreselectMode.None,
    window = {
        completion = cmp.config.window.bordered({
            border = 'rounded',
            scrollbar = true,
        }),
        documentation = cmp.config.window.bordered({
            border = 'rounded',
            max_width = 0,
        }),
    },
    mapping = {
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
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
    },
})

require('conform').setup({
    formatters_by_ft = {
        javascript      = { "prettierd", "prettier", stop_after_first = true },
        typescript      = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        python          = { "autopep8", stop_after_first = true },
        sql             = { "sql_formatter", stop_after_first = true },
    },
    default_format_opts = {
        lsp_format = "fallback",
    },
})

local lint = require('lint')

lint.linters_by_ft = {
    go = { 'golangcilint' },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
    group = vim.api.nvim_create_augroup("lint", { clear = true }),
    callback = function()
        lint.try_lint()
    end,
})
