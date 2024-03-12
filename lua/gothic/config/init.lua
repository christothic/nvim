vim.g.vim_session_filename = ".vimsession"
vim.g.debug_info = { "Debug Info: " }

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.showmode = false

-- undo tree
vim.g.undotree_SetFocusWhenToggle = 1

local user = vim.g.config_username
local config = user .. ".config"
vim.g.user_keymaps = require(config .. ".keymaps")
vim.g.user_keymaps.set_default_keys()
require(config .. ".autocomands")
