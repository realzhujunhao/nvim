vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local opts = { buffer = args.buf }
        vim.keymap.set('n', 'K',
            '<cmd>lua vim.lsp.buf.hover({ border = "rounded", max_width = 70, max_height = 70 })<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help({ border = "rounded" })<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.jump({count=1, float=true})<cr>', opts)
        vim.keymap.set('n', 'gE', '<cmd>lua vim.diagnostic.jump({count=-1, float=true})<cr>', opts)
        vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set('n', '<leader>ac', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        vim.keymap.set('n', '<leader>ih', '<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>')
        -- twice to jump into the float window
        vim.keymap.set('n', 'gw', '<cmd>lua vim.diagnostic.open_float()<cr><cmd>lua vim.diagnostic.open_float()<cr>')

        vim.keymap.set('n', '<leader>fo', function()
            require("conform").format({ async = true })
        end, opts)
        vim.bo[args.buf].formatexpr = "v:lua.require'conform'.formatexpr()"
    end
})

vim.lsp.inlay_hint.enable(true)

vim.lsp.config('clangd', {
    cmd = {
        "clangd", "--fallback-style=webkit"
    }
})

vim.lsp.config('rust_analyzer', {
    settings = {
        rust_analyzer = {
            imports = {
                granularity = {
                    group = "module"
                },
                prefix = "self"
            },
            cargo = {
                buildScripts = {
                    enable = true
                },
                features = "all"
            },
            procMacro = {
                enable = true
            },
            checkOnSave = true,
            check = {
                features = "all",
                command = "clippy"
            },
        },
    },
})

vim.lsp.config('gopls', {
    settings = {
        gopls = {
            usePlaceholders = true,
            hints = {
                ignoredError = true,
                rangeVariableTypes = true,
                assignVariableTypes = true,
                parameterNames = true,
                constantValues = true,
            },
        }
    }
})

vim.lsp.config('ts_ls', {
    init_options = {
        preferences = {
            includeInlayParameterNameHints = 'all',
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
        },
    }
})

vim.lsp.enable({
    'bashls',                          -- bash
    'lua_ls',                          -- lua
    'clangd',                          -- c, cpp, cuda
    'rust_analyzer',                   -- rust
    'gopls',                           -- go
    'protols',                         -- protobuf
    'jdtls',                           -- java
    'docker_language_server',          -- docker
    'docker_compose_language_service', -- docker compose
    'pyright',                         -- python
    'ts_ls',                           -- typescript
    'html',                            -- html
    'astro',                           -- astro
    'taplo',                           -- toml
    'lemminx',                         -- xml
    'jsonls',                          -- json
    'texlab',                          -- latex
    'sqls',                            -- sql
    'tailwindcss',                     -- tailwindcss
    'gh_actions_ls',                   -- github actions
})
