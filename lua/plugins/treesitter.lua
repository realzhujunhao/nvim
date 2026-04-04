vim.pack.add({
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
})

require('nvim-treesitter').install({
    'vimdoc',
    'regex',
    'vim',
})

vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        pcall(vim.treesitter.start, args.buf)
    end,
})
