LSPServers = {
    "lua_ls",
    "clangd",
    "gdscript",
    "bashls", "shellcheck",
    "nil_ls",
    "rust_analyzer",
    "zls",
}
ExtraKeymaps = require("extra_keymaps")
Plugins = {
    require("nvim_dap"),
    --Visual
    { "folke/tokyonight.nvim",   lazy = false,                                           priority = 1000, opts = {}, },
    { 'echasnovski/mini.notify', config = function() require('mini.notify').setup() end, version = false },
    { 'echasnovski/mini.diff',   config = function() require('mini.diff').setup() end,   version = false },
    -- require("obsidian_nvim"),
    require("render_markdown"),
    --LSP
    { "mason-org/mason.nvim", opts = {} },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                highlight = {
                    enable = true, -- Enable syntax highlighting
                },
                indent = {
                    enable = true,                  -- Enable indentation
                    disable = { "gd", "gdscript" }, -- Replace with the file type you want to disable
                },
            })
        end,
        branch = 'master',
        lazy = false,
        build = ":TSUpdate"
    },
    --Movement
    { "junegunn/fzf.vim",     dependencies = { "junegunn/fzf" } },
    { "folke/flash.nvim",     event = "VeryLazy",               opts = {} },
    --Helper
    require("oil_nvim"),
    { "JezerM/oil-lsp-diagnostics.nvim", dependencies = { "stevearc/oil.nvim" }, opts = {} },
    { "benomahony/oil-git.nvim",         dependencies = { "stevearc/oil.nvim" } },
    require("mini_files"),
    { "mbbill/undotree" },
    require("vim_floatterm"),
    require("blink_cmp"),
    { 'echasnovski/mini.ai',    config = function() require('mini.ai').setup() end,    version = false },
    { 'echasnovski/mini.pairs', config = function() require('mini.pairs').setup() end, version = false },
    require("mini_clue"),
    -- { "folke/which-key.nvim", event = "VeryLazy", opts = {}, }, -- breaks '<c-o>gg' on 'i' mode
    -- require("mini_surround"),
    require("advanced_git_search"),
    { 'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim', { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0", } } },
    -- { "habamax/vim-godot" },
}
-- Plugins = nil
local plugins = require("plugins")
if Plugins then plugins.init() end
require("utils")
require("config")
require("keymaps")
require("lsp_config")
if Plugins then plugins.config() end
require("autocmds")
LoadProjectSettings()
