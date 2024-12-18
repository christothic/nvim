-- replace with vim.loop.os_uname().sysname == "Darwin" or jit.os == "OSX" if needed later
if vim.fn.has("macunix") then
    vim.cmd("redir! > ~/.config/nvim/last_log.txt")
else
    vim.cmd("redir! > ~\\AppData\\Local\\nvim\\last_log.txt")
end

vim.g.config_username = "gothic"
require(vim.g.config_username)
