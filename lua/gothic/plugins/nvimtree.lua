return 
{
{
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        -- vim.api.nvim_create_autocmd('TreeAttach', {
        --     group = vim.api.nvim_create_augroup('UserNvimTree', {}),
        --     callback = function(ev)
        --         vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        --     end,
        -- })
        -- require("nvim-tree").setup {
        --     on_attach = function(bufnr)
        --         local api = require "nvim-tree.api"
        --         local function opts(desc)
        --             return {
        --                 desc = "nvim-tree: " .. desc,
        --                 buffer = bufnr,
        --                 noremap = true,
        --                 silent = true,
        --                 nowait = false
        --             }
        --         end
        --         api.config.mappings.default_on_attach(bufnr)
        --         vim.keymap.del('n', '<tab>', {
        --             buffer = bufnr
        --         })
        --     end,
        --     hijack_directories = {
        --         enable = false,
        --         auto_open = false
        --     }
        -- }
    end,
    opts = {}
}
}