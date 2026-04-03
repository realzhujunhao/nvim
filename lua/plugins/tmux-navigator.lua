vim.pack.add({
    { src = 'https://github.com/christoomey/vim-tmux-navigator' },
})

local function bind(lhs, rhs)
    vim.keymap.set('n', lhs, rhs, { noremap = true, silent = true })
end

bind('<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>')
bind('<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>')
bind('<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>')
bind('<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>')
bind('<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>')
