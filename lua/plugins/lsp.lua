return {
    { "williamboman/mason.nvim", opts = {} },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "lua_ls",
                "ts_ls",
                "rust_analyzer",
                "gopls",
                "jdtls",
                "clangd",
                "texlab",
                "taplo",
                "html",
            },
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
                end,

                clangd = function()
                    require('lspconfig').clangd.setup({
                        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
                        cmd = {
                            "clangd", "--fallback-style=webkit"
                        }
                    })
                end
            }
        }
    },
    {
        "neovim/nvim-lspconfig",
        init = function()
            local expand_macro = function()
                vim.lsp.buf_request_all(0, "rust-analyzer/expandMacro",
                    vim.lsp.util.make_position_params(0, 'utf-8'),
                    function(result)
                        vim.cmd("vsplit")
                        local buf = vim.api.nvim_create_buf(false, true)
                        vim.api.nvim_win_set_buf(0, buf)
                        if result then
                            vim.api.nvim_set_option_value("filetype", "rust", { buf = 0 })
                            for _, res in pairs(result) do
                                if res and res.result and res.result.expansion then
                                    vim.api.nvim_buf_set_lines(buf, -1, -1, false, vim.split(res.result.expansion, "\n"))
                                else
                                    vim.api.nvim_buf_set_lines(buf, -1, -1, false, {
                                        "No expansion available."
                                    })
                                end
                            end
                        else
                            vim.api.nvim_buf_set_lines(buf, -1, -1, false, {
                                "Error: No result returned."
                            })
                        end
                    end)
            end

            -- start config
            vim.opt.signcolumn = "yes"
            local lspconfig_defaults = require('lspconfig').util.default_config
            lspconfig_defaults.capabilities = vim.tbl_deep_extend(
                "force",
                lspconfig_defaults.capabilities,
                require("cmp_nvim_lsp").default_capabilities()
            )
            require'lspconfig'.fish_lsp.setup{}
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    vim.cmd("lua vim.lsp.inlay_hint.enable(true)")
                    local opts = { buffer = event.buf }
                    local function hover()
                        vim.lsp.buf.hover({ border = "rounded", max_width = 70, max_height = 70 })
                    end
                    local function signature_help()
                        vim.lsp.buf.signature_help({ border = "rounded" })
                    end
                    vim.keymap.set('n', 'K', hover, opts)
                    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                    vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                    vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.jump({count=1, float=true})<cr>', opts)
                    vim.keymap.set('n', 'gE', '<cmd>lua vim.diagnostic.jump({count=-1, float=true})<cr>', opts)
                    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                    vim.keymap.set('n', 'gs', signature_help, opts)
                    vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                    vim.keymap.set('n', '<leader>fo', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                    vim.keymap.set('n', '<leader>ac', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
                    vim.keymap.set('n', '<leader>ih',
                        '<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>')
                    -- twice to jump into the float window
                    vim.keymap.set('n', 'gw',
                        '<cmd>lua vim.diagnostic.open_float()<cr><cmd>lua vim.diagnostic.open_float()<cr>')
                    vim.keymap.set('n', '<leader>mac', '<cmd>ExpandMacro<cr>')
                    vim.api.nvim_create_user_command('ExpandMacro', expand_macro, {})
                end,
            })
        end
    },
    { "hrsh7th/cmp-nvim-lsp" },
}
