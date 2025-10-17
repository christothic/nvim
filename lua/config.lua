vim.opt.winborder = "rounded"
vim.opt.tabstop = 8
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 4
vim.opt.timeoutlen = 2000
vim.opt.ttimeoutlen = 0
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.updatetime = 250
vim.opt.inccommand = "split"
vim.opt.incsearch = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus")
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.showmode = true
vim.opt.scrolloff = 15
vim.opt.conceallevel = 1
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.termguicolors = true
vim.opt.showmatch = true
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.autoread = true
-- vim.opt.signcolumn = "yes"
vim.opt.encoding = "UTF-8"
vim.opt.cursorcolumn = true
vim.opt.path:append("**")
vim.opt.iskeyword:remove('_')
vim.opt.spelllang = 'en_us'
vim.opt.spell = true

vim.cmd.colorscheme("zaibatsu")
local cursorPosHL = "#3b2d4e"
vim.api.nvim_set_hl(0, "CursorLine", { bg = cursorPosHL })
vim.api.nvim_set_hl(0, "CursorColumn", { bg = cursorPosHL })
vim.api.nvim_set_hl(0, "ModeMsg", { fg = "#fafafa", bg = "#4a4a00" })
vim.api.nvim_set_hl(0, "MatchParen", { fg = "Yellow", bg = "#245424" })
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
