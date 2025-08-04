-- https://github.com/nvimtools/none-ls.nvim
return {
    "nvimtools/none-ls.nvim",
    config = function()
        local nls = require("null-ls")
        nls.setup({
            sources = {nls.builtins.formatting.prettier, nls.builtins.formatting.stylua, nls.builtins.formatting.shfmt,
                       nls.builtins.formatting.eslint_d},
            on_attach = function(client, bufnr)
                if client.server_capabilities.documentFormattingProvider then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({
                                async = true
                            })
                        end
                    })
                end
            end
        })
    end,
    keys = {{
        "<leader>f",
        function()
            vim.lsp.buf.format({
                async = true
            })
        end,
        desc = "Format document with none-ls"
    }}
}
