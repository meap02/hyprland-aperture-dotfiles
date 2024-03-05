require("plugins")
require("whichkey")

-- empty setup using defaults
require("nvim-tree").setup()

-- Color nvim menus
require("options")

-- Telescope keybindings
require("telescope")

-- Treesitter syntax highlighting
require('treesitter')

-- Autocomletion
require('nvim-cmp')

-- Color Text
vim.cmd([[
    set termguicolors
    set nu
]])
vim.opt.tabstop=8
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true

require('colorizer').setup()

-- Language Server Protocol
require("lsp.mason")
require("lsp.handlers").setup()
require("lsp.null-ls")
