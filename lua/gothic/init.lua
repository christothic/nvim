vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.cmd.colorscheme('tokyonight')
vim.cmd("set relativenumber")
-- print(vim.fn.getcwd())
-- require("gothic.keyseer")
-- require("gothic.mappings")
-- require("gothic.nvimtree")
require("gothic.whichkey")
--vim.cmd("NvimTreeClose")
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting


