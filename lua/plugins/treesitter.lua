return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    opts = {
        ensure_installed = {
            "vimdoc",
            "query",
            "regex",
            "vim",
            "go",
        },
        auto_install = true,
        sync_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        }
    },
    build = ":TSUpdate"
}
