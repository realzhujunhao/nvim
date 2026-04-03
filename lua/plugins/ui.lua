vim.pack.add({
    { src = 'https://github.com/sainnhe/gruvbox-material' },
    { src = 'https://github.com/nvim-lualine/lualine.nvim' },
})

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
        set_hl('NvimTreeNormal', palette.none, palette.bg0)
        set_hl('NvimTreeEndOfBuffer', palette.none, palette.bg0)
    end
})

vim.cmd.colorscheme('gruvbox-material')

require('lualine').setup()
