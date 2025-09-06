return {
    { "numToStr/Comment.nvim", opts = {} },
    { "tpope/vim-surround" },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },
    {
        "windwp/nvim-ts-autotag",
        lazy = false,
        opts = {
            opts = {
                enable_close = true,
                enable_rename = true,
                enable_close_on_slash = false
            }
        }
    },
    { "lambdalisue/vim-suda" },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")
            harpoon:setup()

            vim.keymap.set("n", "<M-a>", function() harpoon:list():add() end)
            vim.keymap.set("n", "<M-m>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<M-1>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<M-2>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<M-3>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<M-4>", function() harpoon:list():select(4) end)
            vim.keymap.set("n", "<M-5>", function() harpoon:list():select(5) end)

            -- Toggle previous & next buffers stored within Harpoon list
            vim.keymap.set("n", "<M-p>", function() harpoon:list():prev() end)
            vim.keymap.set("n", "<M-n>", function() harpoon:list():next() end)
        end
    }
}
