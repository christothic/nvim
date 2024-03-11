vim.g.vim_session_filename = ".vimsession"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.showmode = false

vim.g.debug_info = { "Debug Info: " }

local user = vim.g.config_username
local config = user .. ".config"
require(config .. ".keymaps").set_default_keys()
require(config .. ".autocomands")
