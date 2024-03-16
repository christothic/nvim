local M = {}

M.plugin = {
    -- amongst your other plugins
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                size = function(term)
                    if term.direction == "horizontal" then
                        return vim.o.lines * 0.4
                    elseif term.direction == "vertical" then
                        return vim.o.columns * 0.4
                    end
                end,
                open_mapping = [[<c-\>]],
            })
            return true
        end,
    },
    -- or
    -- {'akinsho/toggleterm.nvim', version = "*", opts = {--[[ things you want to change go here]]}}
}

return M
