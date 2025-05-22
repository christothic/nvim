-- Keeping this file as minimal as possible

local user = vim.g.config_username
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- vim.g.user_utils = require(user .. ".utils")
-- require(user .. ".config")
vim.g.lazy_plugins = require(user .. ".lazy_plugins")
vim.g.lazy_plugins.init()
vim.g.mapleader = " "
vim.g.maplocalleader = " "

