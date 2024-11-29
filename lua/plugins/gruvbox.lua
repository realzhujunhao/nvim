return {
    -- {
    --     "ellisonleao/gruvbox.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function(_, opts)
    --         vim.o.background = "dark"
    --         require("gruvbox").setup(opts)
    --         vim.cmd("colorscheme gruvbox")
    --     end,
    --     opts = {
    --         terminal_colors = true, -- add neovim terminal colors
    --         undercurl = true,
    --         underline = true,
    --         bold = true,
    --         italic = {
    --             strings = true,
    --             emphasis = true,
    --             comments = true,
    --             operators = false,
    --             folds = true,
    --         },
    --         strikethrough = true,
    --         invert_selection = false,
    --         invert_signs = false,
    --         invert_tabline = false,
    --         invert_intend_guides = false,
    --         inverse = true, -- invert background for search, diffs, statuslines and errors
    --         contrast = "", -- can be "hard", "soft" or empty string
    --         palette_overrides = {},
    --         overrides = {
    --             NormalFloat = { link = 'Normal' },
    --         },
    --         dim_inactive = false,
    --         transparent_mode = false,
    --     }
    -- },
    {
        'sainnhe/gruvbox-material',
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_background = 'hard'
            vim.g.gruvbox_material_ui_contrast = 'high'
            vim.g.gruvbox_material_enable_italic = true
            vim.g.gruvbox_material_enable_bold = true
            vim.g.gruvbox_material_float_style = 'dim'
            vim.g.gruvbox_material_sign_column_background = 'grey'
            vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
            vim.g.gruvbox_material_statusline_style = 'default'
            vim.api.nvim_create_autocmd('ColorScheme', {
                group = vim.api.nvim_create_augroup('custom_highlights_gruvboxmaterial', {}),
                pattern = 'gruvbox-material',
                callback = function()
                    local config = vim.fn['gruvbox_material#get_configuration']()
                    local palette = vim.fn['gruvbox_material#get_palette'](config.background, config.foreground,
                        config.colors_override)
                    local set_hl = vim.fn['gruvbox_material#highlight']
                    set_hl('NormalFloat', palette.none, palette.bg0)
                    set_hl('FloatBorder', palette.none, palette.bg0)
                end
            })
            vim.cmd.colorscheme('gruvbox-material')
        end
    }
}
