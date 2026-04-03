local fuck_treesitter_no_auto_start = {
    "vimdoc",
    "query",
    "regex",
    "vim",
    "go",
}

local installed_parsers = {}
for _, parser in ipairs(fuck_treesitter_no_auto_start) do
    installed_parsers[parser] = true
end

return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    opts = {
        ensure_installed = fuck_treesitter_no_auto_start,
        auto_install = true,
        sync_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        }
    },
    init = function()
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local file_type = vim.bo[args.buf].filetype

                if not installed_parsers[file_type] then
                    return
                end

                vim.treesitter.start(args.buf)
            end,
        })
    end,
    build = ":TSUpdate"
}
