local function expand_macro()
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
vim.keymap.set('n', '<leader>ma', expand_macro)
