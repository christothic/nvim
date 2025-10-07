vim.api.nvim_create_autocmd({
    "BufEnter",
    "BufWinEnter"
}, {
    pattern = { "vifmrc" },
    callback = function()
        -- vim.treesitter.start()
        vim.opt.commentstring = "\" %s"
    end
})
vim.api.nvim_create_autocmd({
    "BufEnter",
    "BufWinEnter"
}, {
    pattern = { "*.yuck" },
    callback = function()
        vim.treesitter.start()
        vim.opt.commentstring = ";; %s"
    end
})
vim.api.nvim_create_autocmd({
    "BufEnter",
    "BufWinEnter"
}, {
    pattern = { "*.md" },
    callback = function()
        vim.treesitter.start()
    end
})
