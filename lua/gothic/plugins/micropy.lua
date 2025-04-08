local M = {}

M.plugin = {
    "jim-at-jibba/micropython.nvim",
    dependencies = { "akinsho/toggleterm.nvim", "stevearc/dressing.nvim" },
    config = function()
        vim.keymap.set("n", "<leader>pi", require("micropython_nvim").run)
    end,
}

return M
