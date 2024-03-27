local utils = vim.g.user_utils

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        utils.log_current_buffers()
        vim.api.nvim_create_user_command("ShowConfigLog", utils.show_startup_floating_window, {})
        if not utils.check_for_workspace() then
            utils.log("workspaces false")
            vim.defer_fn(function()
                vim.cmd("Telescope workspaces")
            end, 1)
        end
    end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        require("neo-tree.command").execute({ action = "close" })
        local workspaces = require("workspaces")
        local ws_name = workspaces.name()
        if ws_name then
            vim.cmd("mksession! " --[[ .. workspace.path  ]] .. vim.g.vim_session_filename)
        end
    end,
})
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup(
        vim.g.config_username .. "-highlight-yank",
        { clear = true }
    ),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- vim.api.nvim_create_autocmd("BufWritePost", {
--     group = vim.api.nvim_create_augroup("__formatter__", { clear = true }),
--     command = ":FormatWrite",
-- })

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    -- pattern = "SConstruct",
    callback = function()
        -- print("scons file")
        -- if vim.fn.search("{{.\\+}}", "nw") ~= 0 then
        -- local buf = vim.api.nvim_get_current_buf()
        -- vim.api.nvim_buf_set_option(buf, "filetype", "python")
        -- end
    end,
})
