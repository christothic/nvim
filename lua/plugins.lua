M = {}
M.init = function()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not (vim.uv or vim.loop).fs_stat(lazypath) then
        local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", "https://github.com/folke/lazy.nvim.git", lazypath })
        if vim.v.shell_error ~= 0 then
            vim.api.nvim_echo({ { "Failed to clone lazy.nvim:\n", "ErrorMsg" }, { out, "WarningMsg" }, { "\nPress any key to exit..." }, }, true, {})
            vim.fn.getchar()
            os.exit(1)
        end
    end
    vim.opt.rtp:prepend(lazypath)
end
M.config = function()

    require("lazy").setup({
        spec = PLUGINS,
        install = { colorscheme = { "zaibatsu" } },
        checker = { enabled = false },
        -- checker = { enabled = true },
    })
    vim.cmd.colorscheme("tokyonight-night")
    vim.api.nvim_set_hl(0, "Normal", { bg = "none"} )
    -- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none"} )
    vim.api.nvim_set_hl(0, "NonText", { bg = "none"} )
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none"} )
end
return M
