return 
{
{
    "nvim-treesitter/nvim-treesitter",
    version = "*",
    lazy = false,
    config = function()
        local ts = require('nvim-treesitter.configs')
        ts.setup {
            ensure_installed = {"c", "lua", "vim", "vimdoc", "query"},
            highlight = {
                enable = true
            }
        }
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
    opts = {}
}
}