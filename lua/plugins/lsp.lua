return {
    { "williamboman/mason.nvim", opts = {} },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls", "rust_analyzer" },
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,

                rust_analyzer = function()
                    require('lspconfig').rust_analyzer.setup({
                        on_attach = function(_, bufnr)
                            print("lspconfig load rust_analyzer")
                            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                        end,
                        settings = {
                            ["rust_analyzer"] = {
                                imports = {
                                    granularity = {
                                        group = "module"
                                    },
                                    prefix = "self"
                                },
                                cargo = {
                                    buildScripts = {
                                        enable = true
                                    }
                                },
                                procMacro = {
                                    enable = true
                                },
                                check = {
                                    command = "clippy"
                                }
                            }
                        }
                    })
                end
            }
        }
    },
    {
        "neovim/nvim-lspconfig",
        init = function()
            vim.opt.signcolumn = "yes"
            local lspconfig_defaults = require('lspconfig').util.default_config
            lspconfig_defaults.capabilities = vim.tbl_deep_extend(
                "force",
                lspconfig_defaults.capabilities,
                require("cmp_nvim_lsp").default_capabilities()
            )
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local function show_diagnostics_on_hover()
                        local opts = {
                            focusable = false,
                            close_events = { "CursorMoved", "CursorMovedI", "BufHidden", "InsertCharPre", "WinLeave" },
                            scope = 'line',
                        }
                        vim.diagnostic.open_float(nil, opts)
                    end
                    vim.api.nvim_create_autocmd("CursorHold", {
                        pattern = "*",
                        callback = show_diagnostics_on_hover
                    })

                    vim.cmd("lua vim.lsp.inlay_hint.enable(true)")
                    local opts = { buffer = event.buf }
                    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                    vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                    vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                    vim.keymap.set('n', '<leader>fo', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                    vim.keymap.set('n', '<leader>ac', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
                    vim.keymap.set('n', '<leader>ih',
                        '<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>')
                end,
            })
        end
    },
    { "hrsh7th/cmp-nvim-lsp" },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                sources = {
                    { name = "nvim_lsp" }
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end
                },
                preselect = cmp.PreselectMode.None,
                mapping = {
                    ["<CR>"] = function(fallback)
                        if cmp.visible() then
                            cmp.confirm({ select = false })
                        else
                            fallback()
                        end
                    end,
                    ["<Tab>"] = function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end,
                    ["<S-Tab>"] = function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end,
                    ["<C-b>"] = function(fallback)
                        if cmp.visible() then
                            cmp.scroll_docs(-4)
                        else
                            fallback()
                        end
                    end,
                    ["<C-f>"] = function(fallback)
                        if cmp.visible() then
                            cmp.scroll_docs(4)
                        else
                            fallback()
                        end
                    end
                }
            })
        end
    },
}
