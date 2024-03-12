local utils = vim.g.user_utils

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local wait_time = 50
        if not utils.load_vim_session(wait_time) then vim.defer_fn(function() vim.cmd("Telescope workspaces") end, wait_time) end
        utils.log_current_buffers()
        vim.api.nvim_create_user_command("ShowConfigLog", utils.show_startup_floating_window, {})
    end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function() vim.cmd("mksession! " .. vim.g.vim_session_filename) end,
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup(vim.g.config_username .. "-highlight-yank", { clear = true }),
    callback = function() vim.highlight.on_yank() end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("__formatter__", { clear = true }),
    command = ":FormatWrite",
})
