return {
    "nvim-treesitter/nvim-treesitter",
    config = function(_, opts)
        local configs = require("nvim-treesitter.configs")
        configs.setup(opts)
    end,
    opts = {
        ensure_installed = {
            "vimdoc",
            "query",
            "regex",
            "vim",
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
