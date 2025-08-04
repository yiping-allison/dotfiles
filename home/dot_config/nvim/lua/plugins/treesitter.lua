-- https://github.com/nvim-treesitter/nvim-treesitter
return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = {"python", "go", "typescript", "javascript", "bash", "lua"},
            sync_install = false,
            highlight = {
                enabled = true
            },
            indent = {
                enable = true
            }
        })
    end
}
