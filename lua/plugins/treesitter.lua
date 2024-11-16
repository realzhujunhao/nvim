return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = {
            "bash",
            "html",
            "java",
            "c",
            "vimdoc",
            "latex",
            "javascript",
            "typescript",
            "json",
            "lua",
            "rust",
            "go",
            "markdown",
            "markdown_inline",
            "python",
            "query",
            "regex",
            "tsx",
            "vim",
            "yaml",
        },
        auto_install = true,
        highlignt = {
            enable = true,
            additional_vim_regex_highlighting = false,
        }
    },
    build = ":TSUpdate"
}
