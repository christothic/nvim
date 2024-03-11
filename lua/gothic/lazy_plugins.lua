local M = {}

M.plugins = {}
M.opts = {}

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
    local debug_info = vim.g.debug_info
    for _, file in ipairs(files) do
        table.insert(debug_info, "Loading: " .. file)
        table.insert(M.plugins, dofile(file).plugin)
    end
    vim.g.debug_info = debug_info
        
    print("plugins_path: " .. plugins_path)

    require("lazy").setup(M.plugins, M.opts)
end


return M
