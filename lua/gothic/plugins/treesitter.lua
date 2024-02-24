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
    end,
    opts = {}
}
}