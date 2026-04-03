vim.pack.add({
    { src = 'https://github.com/nvim-tree/nvim-tree.lua' }
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

require('nvim-tree').setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        icons = {
            glyphs = {
                folder = {
                    arrow_closed = "󰜴", -- arrow when folder is closed
                    arrow_open = "󱞪", -- arrow when folder is open
                },
            },
        },
    },
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
    filters = {
        enable = false,
    },
})
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

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
