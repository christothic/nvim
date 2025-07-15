LSERVERS = {
    "lua_ls",
    "clangd",
    "bashls", "shellcheck",
    "nil_ls",
}
PLUGINS = {
    require("nvim_dap"),
    { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {}, },
    { "mason-org/mason.nvim", opts = {} },
    { "junegunn/fzf.vim", dependencies = { "junegunn/fzf" } },
    { "nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate" },
    { "folke/which-key.nvim", event = "VeryLazy", opts = {} },
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
