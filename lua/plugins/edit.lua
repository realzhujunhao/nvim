vim.pack.add({
    { src = 'https://github.com/numtostr/comment.nvim' },
    { src = 'https://github.com/lambdalisue/vim-suda' },
    { src = 'https://github.com/tpope/vim-surround' },
    { src = 'https://github.com/windwp/nvim-autopairs' },
    { src = 'https://github.com/hiphish/rainbow-delimiters.nvim' },
})

require('Comment').setup()
require('nvim-autopairs').setup()
