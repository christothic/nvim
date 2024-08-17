local M = {}

M.plugin = {
    "natecraddock/workspaces.nvim",
    version = "*",
    lazy = false,
    config = function()
        require("workspaces").setup({
            hooks = {
                open = {
                    function()
                        vim.cmd("bufdo bwipeout")
                        -- vim.g.debug_info = vim.list_extend(vim.g.debug_info, { "Opened workpace " })
                        vim.g.user_utils.load_vim_session()
                    end,
                },
            },
        })
    end,
    opts = {},
}

return M
