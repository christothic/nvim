local M = {}

M.plugin = {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
        require("mini.files").setup()
        require("mini.ai").setup()
        require("mini.surround").setup()
    end,
}

return M
