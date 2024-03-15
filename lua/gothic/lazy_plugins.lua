-- Plugin load logic

local M = {}

M.plugins = {}
M.opts = {
    ui = {
        -- If you have a Nerd Font, set icons to an empty table which will use the
        -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
        icons = {
            -- cmd = "⌘",
            -- config = "🛠",
            -- event = "📅",
            -- ft = "📂",
            -- init = "⚙",
            -- keys = "🗝",
            -- plugin = "🔌",
            -- runtime = "💻",
            -- require = "🌙",
            -- source = "📄",
            -- start = "🚀",
            -- task = "📌",
            -- lazy = "💤 ",
        },
    },
}

M.init = function()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)

    local user = vim.g.config_username
    local plugins_path = "lua/" .. user .. "/plugins/*.lua"
    local files = vim.api.nvim_get_runtime_file(plugins_path, true)
    -- print(vim.inspect(vim.g.debug_info)
    for _, file in ipairs(files) do
        vim.g.debug_info = vim.list_extend(vim.g.debug_info, { "loading: " .. file })
        table.insert(M.plugins, dofile(file).plugin)
        -- vim.list_extend(M.plugins, dofile(file).plugin)
    end
    require("lazy").setup(M.plugins, M.opts)
end

return M
