vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.md",
    callback = function()
        vim.treesitter.start()
    end
})
