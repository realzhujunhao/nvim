vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 300
vim.opt.signcolumn = "yes"

function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

local keyset = vim.keymap.set
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
local sino = { silent = true, noremap = true }

-- Tab          select next completion
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
-- Shift-tab    select previous completion
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
-- Enter        apply selected completion
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
-- Ctrl-space   trigger completion
keyset("i", "<c-space>", "coc#refresh()", { silent = true, expr = true, noremap = true })

-- LEADER-f     format selected
keyset("x", "<leader>f", "<Plug>(coc-format-selected)", sino)
-- LEADER-f     format document
keyset("n", "<leader>f", "<CMD>call CocAction('format')<CR>", sino)

-- gd goto      definition
keyset("n", "gd", "<Plug>(coc-definition)", sino)
-- gi goto      implementation
keyset("n", "gi", "<Plug>(coc-implementation)", sino)
-- ge goto      error
keyset("n", "ge", "<CMD>call CocAction('diagnosticNext')<CR>", sino)

-- LEADER-doc   show documentation
keyset("n", "<leader>doc", '<CMD>lua _G.show_docs()<CR>', sino)

-- Ctrl-f       scroll down documentation
keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)

-- Shift-f      scroll down float
keyset("n", "<S-f>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<S-f>"', opts)

-- LEADER-rn    rename specifier
keyset("n", "<leader>rn", "<Plug>(coc-rename)", sino)

-- LEADER-pp    toggle diagnostic
keyset("n", "<leader>pp", "<CMD>call CocAction('diagnosticToggle')<CR>", sino)

-- RUST ONLY
-- LEADER-rs    restart lsp
keyset("n", "<leader>rs", "<CMD>CocCommand rust-analyzer.reload<CR>", sino)
-- LEADER-l     join lines
keyset("n", "<leader>l", "<CMD>CocCommand rust-analyzer.joinLines<CR>", sino)
-- LEADER-m     expand macro
keyset("n", "<leader>m", "<CMD>CocCommand rust-analyzer.expandMacro<CR>", sino)


vim.g.coc_global_extensions = {
    'coc-json',
    'coc-git',
    'coc-terminal',
    'coc-pairs',
    'coc-lists',
    'coc-html',
    'coc-toml',
    'coc-sh',
    'coc-pyright',
    'coc-tsserver',
    'coc-java',
    'coc-go',
    'coc-clangd',
    'coc-rust-analyzer',
    'coc-fish',
    'coc-docker',
    'coc-lua',
    'coc-yaml'
}
