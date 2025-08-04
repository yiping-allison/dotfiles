-- https://github.com/mason-org/mason.nvim
return {{
    "mason-org/mason.nvim",
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    }
}, {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {"pyright", "gopls", "lua_ls", "marksman", "denols"}
    },
    dependencies = {{
        "mason-org/mason.nvim",
        opts = {}
    }, "neovim/nvim-lspconfig"}
}, {
    "neovim/nvim-lspconfig",
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup({
            capabilities = capabilities
        })
        lspconfig.pyright.setup({
            capabilities = capabilities
        })
        lspconfig.gopls.setup({
            capabilities = capabilities
        })
        lspconfig.denols.setup({
            capabilities = capabilities
        })
        lspconfig.marksman.setup({
            capabilities = capabilities
        })
    end,
    keys = {{
        "K",
        vim.lsp.buf.hover,
        desc = "Show hover information"
    }, {
        "gd",
        vim.lsp.buf.definition,
        desc = "Go to definition"
    }, {
        "gD",
        vim.lsp.buf.declaration,
        desc = "Go to declaration"
    }, {
        "gi",
        vim.lsp.buf.implementation,
        desc = "Go to implementation"
    }, {
        "gr",
        vim.lsp.buf.references,
        desc = "Show references"
    }, {
        "<leader>rn",
        vim.lsp.buf.rename,
        desc = "Rename symbol"
    }, {
        "<leader>ca",
        vim.lsp.buf.code_action,
        desc = "Code action"
    }}
}}
