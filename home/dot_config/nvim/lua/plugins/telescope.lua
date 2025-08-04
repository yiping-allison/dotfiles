-- https://github.com/nvim-telescope/telescope.nvim
return {{
    "nvim-telescope/telescope.nvim",
    tag = '0.1.8',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
        require("telescope").setup({
            defaults = {
                defaults = {
                    vimgrep_arguments = {"rg", "--color=auto", "--no-heading", "--with-filename", "--line-number",
                                         "--column", "--smart-case", "--trim"}
                }
            },
            pickers = {
                find_files = {
                    find_command = {"rg", "--files", "--hidden", "--glob", "!.git/*"}
                }
            }
        })
    end,
    keys = {{
        "<leader>ff",
        function()
            return require("telescope.builtin").find_files({
                hidden = true,
                no_ignore = true
            })
        end,
        desc = "Find files"
    }, {
        "<leader>fg",
        function()
            return require("telescope.builtin").live_grep({
                additional_args = function(opts)
                    return {"--hidden", "--glob", "!.git/*"}
                end
            })
        end,
        desc = "Live grep"
    }, {
        "<leader>j",
        function()
            return require("telescope.builtin").jumplist()
        end,
        desc = "Jump list"
    }}
}, {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = {"nvim-telescope/telescope.nvim"},
    config = function()
        extensions = {
            ["ui-select"] = {require("telescope.themes").get_dropdown({
                winblend = 10,
                border = true
            })}
        }
        require("telescope").load_extension("ui-select")
    end
}}
