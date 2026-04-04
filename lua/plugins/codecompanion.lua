vim.pack.add({
    { src = 'https://github.com/olimorris/codecompanion.nvim' },
    { src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim' },
})

require('render-markdown').setup()

require('codecompanion').setup({
    interactions = {
        chat = {
            adapter = {
                name = "ollama",
                model = "gpt-oss:20b"
            }
        },
        inline = {
            adapter = {
                name = "ollama",
                model = "gpt-oss:20b"
            }
        },
        background = {
            adapter = {
                name = "ollama",
                model = "gpt-oss:20b"
            }
        },
    },
})


vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<C-t>", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "<C-c>", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
vim.cmd([[cab cc CodeCompanion]])
