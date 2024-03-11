
local user = vim.g.config_username
vim.g.user_utils = require(user .. ".utils")
require(user .. ".config")
vim.g.lazy_plugins = require(user .. ".lazy_plugins")
vim.g.lazy_plugins.init()

