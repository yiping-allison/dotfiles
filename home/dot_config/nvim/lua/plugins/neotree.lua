-- https://github.com/nvim-neo-tree/neo-tree.nvim
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim"},
    lazy = false,
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            enable_diagnostics = false,
            filesystem = {
                follow_current_file = true,
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false
                }
            },
            window = {
                mappings = {
                    ["P"] = {
                        "toggle_preview", -- Toggle preview of the file under the cursor
                        config = {
                            use_float = false
                        }
                    }
                }
            }
        })
    end,
    keys = {{
        "<leader>n",
        ":Neotree filesystem reveal left<CR>",
        desc = "Neo-tree filesystem"
    }, {
        "<leader>nf",
        ":Neotree reveal<CR>",
        desc = "Neo-tree focus current file"
    }, {
        "<leader>nc",
        ":Neotree close<CR>",
        desc = "Neo-tree close"
    }}
}
