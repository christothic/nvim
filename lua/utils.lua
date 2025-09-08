function FileExists(name)
    local f = io.open(name, "r")
    return f ~= nil and io.close(f)
end

function LoadProjectSettings()
    if FileExists(vim.fn.getcwd() .. "/.setenv.lua") then
        vim.cmd("luafile .setenv.lua")
    end
end
