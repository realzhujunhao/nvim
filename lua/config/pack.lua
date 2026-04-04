if not vim.pack or not vim.pack.add then
    vim.notify("vim.pack is unavailable. Please use Neovim 0.12+.", vim.log.levels.ERROR)
    return
end

vim.pack.add({
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
    { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
})

require('plugins.treesitter')
require('plugins.ui')
require('plugins.gitsigns')
require('plugins.edit')
require('plugins.tmux-navigator')
require('plugins.nvim-tree')
require('plugins.telescope')
require('plugins.lsp')
require('plugins.codecompanion')
