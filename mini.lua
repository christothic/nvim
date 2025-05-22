-- replace with vim.loop.os_uname().sysname == "Darwin" or jit.os == "OSX" if needed later
if not vim.g.vscode then
    if vim.fn.has("macunix") then
        vim.cmd("redir! > ~/.config/nvim/last_log.txt")
    else
        vim.cmd("redir! > ~\\AppData\\Local\\nvim\\last_log.txt")
    end
end

vim.g.config_username = "mini"
require(vim.g.config_username)
