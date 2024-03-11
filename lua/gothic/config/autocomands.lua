local utils = vim.g.user_utils

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
        utils.load_vim_session()
        utils.log_current_buffers()
        vim.api.nvim_create_user_command('ShowConfigLog', utils.show_startup_floating_window, {})
	end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
        vim.cmd("mksession! " .. vim.g.vim_session_filename)
	end,
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
      vim.highlight.on_yank()
    end,
  })