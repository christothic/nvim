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
                        vim.g.user_utils.load_vim_session()
                        -- print("Opened workspace")
                    end,
                    "Telescope find_files",
                },
            },
        })
    end,
    opts = {},
}

return M
