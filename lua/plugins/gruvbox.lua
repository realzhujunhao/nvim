vim.pack.add({
    { src = 'https://github.com/sainnhe/gruvbox-material' }
})

vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_ui_contrast = 'high'
vim.g.gruvbox_material_enable_italic = true
vim.g.gruvbox_material_enable_bold = true
vim.g.gruvbox_material_float_style = 'dim'
vim.g.gruvbox_material_sign_column_background = 'grey'
vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
vim.g.gruvbox_material_statusline_style = 'default'

vim.cmd.colorscheme('gruvbox-material')
