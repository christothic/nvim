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
                        -- if not vim.g.user_utils.load_vim_session() then vim.cmd("Telescope find_files") end
                        vim.g.user_utils.load_vim_session()
                    end,
                    "Telescope find_files",
                },
            },
        })
    end,
    opts = {},
}

return M
