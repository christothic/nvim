if not vim.g.vscode then
    if vim.fn.has("macunix") == 1 then
        vim.cmd("redir! > ~/.config/nvim/last_log.txt")
    else
        vim.cmd("redir! > ~\\AppData\\Local\\nvim\\last_log.txt")
    end
    vim.g.config_username = "gothic" -- use this to change config folders
    require(vim.g.config_username)
end
