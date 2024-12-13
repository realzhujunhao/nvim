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
    }
}
