vim.g.vim_session_filename = ".vimsession"
vim.g.debug_info = { "Debug Info: " }

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.showmode = true
vim.opt.scrolloff = 20
vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.cursorline = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.inccommand = "split"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- undo tree
vim.g.undotree_SetFocusWhenToggle = 1

local user = vim.g.config_username
local config = user .. ".config"
vim.g.user_keymaps = require(config .. ".keymaps")
vim.g.user_keymaps.set_default_keys()
require(config .. ".autocomands")
