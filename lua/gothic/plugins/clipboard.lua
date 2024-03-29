local M = {}

M.plugin = {
    "AckslD/nvim-neoclip.lua",
    requires = {
        { "nvim-telescope/telescope.nvim" },
        { "kkharji/sqlite.lua", module = "sqlite" },
    },
    config = function()
        require("neoclip").setup()
    end,
}

return M
