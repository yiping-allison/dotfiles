-- transparency
vim.api.nvim_set_hl(0, "Normal", {
    bg = "none"
})
vim.api.nvim_set_hl(0, "NormalNC", {
    bg = "none"
})
vim.api.nvim_set_hl(0, "EndOfBuffer", {
    bg = "none"
})

-- basic
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false

-- tab and spacing
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- visual
vim.opt.termguicolors = true
vim.opt.showmatch = true
vim.opt.pumheight = 10
vim.opt.pumblend = 10
vim.opt.winblend = 0

-- behavior
vim.opt.clipboard:append("unnamedplus") -- use system clipboard
vim.opt.modifiable = true -- allow modification of buffers
vim.opt.encoding = "UTF-8" -- set encoding to utf-8

-- splits
vim.opt.splitbelow = true -- horizontal splits open below
vim.opt.splitright = true -- vertical splits open to the right

require("config.lazy")
