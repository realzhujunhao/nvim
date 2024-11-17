return {
    "nvim-tree/nvim-tree.lua",
    opts = {
        -- change folder arrow icons
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
        -- disable window_picker for explorer to work well with window splits
        actions = {
            open_file = {
                window_picker = {
                    enable = false,
                },
            },
        },
    },
    lazy = false,
    init = function()
        -- disable netrw at the very start of your init.lua
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end,
    config = function(_, opts)
        -- change color for arrows in tree to light blue
        vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])
        require("nvim-tree").setup(opts)
    end,
    keys = {
        { "<leader>e", "<CMD>NvimTreeToggle<CR>", mode = "n", silent = true, noremap = true }
    }
}
