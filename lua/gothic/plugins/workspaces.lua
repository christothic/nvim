return
{
    "natecraddock/workspaces.nvim",
    version = "*",
    lazy = false,
    config = function()
        require('workspaces').setup({
            hooks = {
                -- open = { "Teslescope find_files"},
            },
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
    opts = {}
}
