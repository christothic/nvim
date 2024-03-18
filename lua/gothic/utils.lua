-- General funcs to use on the fly
local M = {}

M.table_concat = function(t1, t2)
    for i = 1, #t2 do
        t1[#t1 + 1] = t2[i]
    end
    return t1
end

M.log = function(message)
    vim.g.debug_info = vim.list_extend(vim.g.debug_info, { message })
end

M.compare_paths = function(path1, path2)
    if path1:sub(-1) == "\\" then path1 = path1:sub(1, -2) end
    if path2:sub(-1) == "\\" then path2 = path2:sub(1, -2) end
    return path1 == path2
end

M.check_for_workspace = function()
    vim.g.debug_info = vim.list_extend(vim.g.debug_info, { "Args " .. vim.inspect(vim.v.argv) })
    local workspaces = require("workspaces")
    for _, workspace in ipairs(workspaces.get()) do
        local path = workspace.path
        local wait_time = 1
        for i, arg in pairs(vim.v.argv) do
            if i == 1 or i == 2 then goto continue end
            vim.g.debug_info =
                vim.list_extend(vim.g.debug_info, { "Checking " .. arg .. " with " .. path })
            if M.compare_paths(arg, path) then
                vim.g.debug_info =
                    vim.list_extend(vim.g.debug_info, { "Found " .. arg .. " " .. path })
                vim.defer_fn(function()
                    workspaces.open(workspace.name)
                end, wait_time)
                return true
            end
            ::continue::
        end
        if M.compare_paths(vim.fn.getcwd(), path) then
            vim.defer_fn(function()
                workspaces.open(workspace.name)
            end, wait_time)
            return true
        end
    end
    return false
end

M.load_vim_session = function(wait_time)
    local session_file = vim.g.vim_session_filename
    local f = io.open(session_file, "r")
    local found = f ~= nil
    if found then
        io.close(f)
        vim.g.debug_info = vim.list_extend(vim.g.debug_info, { "Found " .. session_file })
        if wait_time == nil then
            vim.cmd("source " .. session_file)
        else
            vim.defer_fn(function()
                vim.cmd("source " .. session_file)
            end, wait_time)
        end
    else
        vim.g.debug_info = vim.list_extend(
            vim.g.debug_info,
            { "no " .. session_file .. " on " .. tostring(vim.fn.getcwd()) }
        )
    end
    return found
end

M.show_startup_floating_window = function()
    local buffer = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buffer, 0, -1, false, vim.g.debug_info)
    local width = vim.api.nvim_get_option("columns")
    local height = vim.api.nvim_get_option("lines")
    local win_height = math.ceil(height * 0.8)
    local win_width = math.ceil(width * 0.8)
    local row = math.ceil((height - win_height) / 2)
    local col = math.ceil((width - win_width) / 2)
    local opts = {
        relative = "editor",
        width = win_width,
        height = win_height,
        row = row,
        col = col,
        style = "minimal",
    }
    vim.api.nvim_open_win(buffer, true, opts)
    vim.api.nvim_buf_set_keymap(buffer, "n", "q", ":q<CR>", { noremap = true, silent = true })
end

M.log_current_buffers = function()
    local buffer_to_close = nil
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        local buf_name = vim.api.nvim_buf_get_name(buf)
        local is_listed = vim.api.nvim_buf_get_option(buf, "buflisted")
        vim.g.debug_info =
            vim.list_extend(vim.g.debug_info, {
                "Buf Num: " .. buf .. ", Buf Name: " .. buf_name .. ", Listed: " .. tostring(
                    is_listed
                ) .. ", t: " .. tostring(vim.bo[buf].readonly) .. ", cwd?: " .. tostring(
                    buf_name == vim.fn.getcwd()
                ),
            })
        if buf_name == vim.fn.getcwd() then buffer_to_close = buf end
    end
    if buffer_to_close then vim.api.nvim_buf_delete(buffer_to_close, { force = true }) end
end

return M
