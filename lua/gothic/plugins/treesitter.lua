local M = {}

M.plugin = {
        "nvim-treesitter/nvim-treesitter",
        -- build = ":TSUpdate",
        -- version = "*",
        -- lazy = false,
        config = function()
            local ts = require("nvim-treesitter.configs")
            ts.setup({
                ensure_installed = { "bash", "c", "html", "lua", "markdown", "vim", "vimdoc", "query" },
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
            -- local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()
            -- parser_config.powershell = {
            --     install_info = {
            --         url = "~/<WhereIClonedTheRepo>/tree-sitter-PowerShell",
            --         files = { "src/parser.c" },
            --         branch = "main",
            --         generate_requires_npm = false,
            --         requires_generate_from_grammar = false,
            --     },
            --     filetype = "ps1",
            -- }
        end,
        opts = {},
    -- "nvim-treesitter/nvim-treesitter",
    -- build = ":TSUpdate",
    -- opts = {
    --     ensure_installed = { "bash", "c", "html", "lua", "markdown", "vim", "vimdoc" },
    --     -- Autoinstall languages that are not installed
    --     auto_install = true,
    --     highlight = { enable = true },
    --     indent = { enable = true },
    -- },
    -- config = function(_, opts)
    --     -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

    --     ---@diagnostic disable-next-line: missing-fields
    --     require("nvim-treesitter.configs").setup(opts)

    --     -- There are additional nvim-treesitter modules that you can use to interact
    --     -- with nvim-treesitter. You should go explore a few and see what interests you:
    --     --
    --     --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --     --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --     --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    -- end,
}

return M
