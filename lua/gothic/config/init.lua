vim.g.vim_session_filename = ".vimsession"

vim.g.loaded_netrwPlugin = 1
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.showmode = true
vim.opt.scrolloff = 15

vim.opt.conceallevel = 1

vim.opt.tabstop = 8
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true

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

-- terminal stuff
if vim.g.vscode then
else
    vim.opt.shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "bash"
end
-- vim.opt.shellcmdflag =
--     "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
-- vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
-- vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
-- vim.opt.shellquote = ""
-- vim.opt.shellxquote = ""

local user = vim.g.config_username
local config = user .. ".config"
vim.g.user_keymaps = require(config .. ".keymaps")
if vim.g.vscode then
else
    vim.g.user_keymaps.set_default_keys()
    -- vim.g.user_keymaps.set_debugger_keys()
    require(config .. ".autocomands")
end
