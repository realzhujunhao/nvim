local border = "rounded"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = border,
    max_height = 70,
    max_width = 70,
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = border,
})

vim.diagnostic.config({
    virtual_text = true,
    float = {
        border = "rounded",
        source = true,
        prefix = "",
    }
})

vim.o.pumwidth = 40
vim.o.pumheight = 15
vim.o.pumblend = 25
