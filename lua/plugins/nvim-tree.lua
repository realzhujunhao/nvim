vim.pack.add({
    { src = 'https://github.com/nvim-tree/nvim-tree.lua' }
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

local config = {
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        enable = false,
    },
}

require('nvim-tree').setup(config)

local api = require('nvim-tree.api')

vim.keymap.set('n', '<leader>e',
    function()
        api.tree.toggle({
            path = '<args>',
            find_file = false,
            update_root = false,
            focus = true,
        })
    end, {
        noremap = true, silent = true,
    }
)
