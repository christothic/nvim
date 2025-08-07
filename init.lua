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
    --Helper
    { "folke/which-key.nvim", event = "VeryLazy", opts = {}, },
    { "mbbill/undotree" },
    require("vim_floatterm"),
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
