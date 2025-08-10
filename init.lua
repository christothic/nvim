LSERVERS = {
    "lua_ls",
    "clangd",
    "bashls", "shellcheck",
    "nil_ls",
    "rust_analyzer",
}
PLUGINS = {
    require("nvim_dap"),
    --Color
    { "folke/tokyonight.nvim",           lazy = false,                     priority = 1000, opts = {}, },
    --LSP
    { "mason-org/mason.nvim",            opts = {} },
    { "nvim-treesitter/nvim-treesitter", branch = 'master',                lazy = false,    build = ":TSUpdate" },
    --Movement
    { "junegunn/fzf.vim",                dependencies = { "junegunn/fzf" } },
    { "folke/flash.nvim",                event = "VeryLazy",               opts = {} },
    require("oil_nvim"),
    { "JezerM/oil-lsp-diagnostics.nvim", dependencies = { "stevearc/oil.nvim" }, opts = {} },
    { "benomahony/oil-git.nvim",         dependencies = { "stevearc/oil.nvim" } },
    -- { "refractalize/oil-git-status.nvim", dependencies = { "stevearc/oil.nvim", }, config = true, },
    require("mini_files"),
    --Helper
    -- { "folke/which-key.nvim", event = "VeryLazy", opts = {}, }, -- breaks '<c-o>gg' on 'i' mode
    { "mbbill/undotree" },
    require("vim_floatterm"),
    { 'echasnovski/mini.ai',     config = function() require('mini.ai').setup() end,     version = false },
    { 'echasnovski/mini.diff',   config = function() require('mini.diff').setup() end,   version = false },
    { 'echasnovski/mini.notify', config = function() require('mini.notify').setup() end, version = false },
    { 'echasnovski/mini.pairs',  config = function() require('mini.pairs').setup() end,  version = false },
    require("mini_clue"),
    -- require("mini_surround"),
}
-- PLUGINS = nil
local plugins = require("plugins")
if PLUGINS then
    plugins.init()
end
require("config")
require("keymaps")
require("lsp_config")
if PLUGINS then
    plugins.config()
    require("extra_keymaps")
end
