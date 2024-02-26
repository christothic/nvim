local debug = false
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.cmd.colorscheme('tokyonight')
vim.cmd("set relativenumber")
-- require("gothic.keyseer")
-- local nvimtreeapi = 
require("gothic.keymaps")
-- nvimtreeapi.tree.close()
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

-- Define a function to scan all buffers
-- local function scanAllBuffers()
--     for _, buf in ipairs(vim.api.nvim_list_bufs()) do
--         if vim.api.nvim_buf_is_loaded(buf) then
--             local buf_name = vim.api.nvim_buf_get_name(buf)
--             local is_listed = vim.api.nvim_buf_get_option(buf, 'buflisted')
--             -- Perform operations with the buffer information here
--             print("Buffer Number: " .. buf .. ", Buffer Name: " .. buf_name .. ", Is Listed: " .. tostring(is_listed))
--         end
--     end
-- end

local debug_Info = {}

local function showStartUpFloatingWindow()
    if #debug_Info == 0 then return end
    local buffer = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buffer, 0, -1, false, debug_Info)
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
        style = "minimal"
    }
    local win = vim.api.nvim_open_win(buffer, true, opts)
    vim.api.nvim_buf_set_keymap(buffer, 'n', 'q', ':q<CR>', {noremap = true, silent = true})
end

local function showBuffersInFloatingWindow()
    local buffer_to_close = nil
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        --if vim.api.nvim_buf_is_loaded(buf) then
        local buf_name = vim.api.nvim_buf_get_name(buf)
        if debug then
            print("Buffer Number: " .. buf)
            local is_listed = vim.api.nvim_buf_get_option(buf, 'buflisted')
            table.insert(debug_Info, "Buf Num: " .. buf .. ", Buf Name: " .. buf_name .. 
            ", Listed: " .. tostring(is_listed) .. ", t: " .. tostring(vim.bo[buf].readonly) ..
            ", cwd?: " .. tostring(buf_name == vim.fn.getcwd()))
        end
        if buf_name == vim.fn.getcwd() then
            buffer_to_close = buf
        end
    end
    if buffer_to_close then
        vim.api.nvim_buf_delete(buffer_to_close, {force = true})
    end
end

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.defer_fn(showStartUpFloatingWindow, 1000)
    end
})

vim.api.nvim_create_autocmd("VimEnter", {
    callback = showBuffersInFloatingWindow
})

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local f = io.open('.vim', "r")
        if (f ~= nil) then
            io.close(f)
            if debug then
                table.insert(debug_Info, "Found .vim")
            end
            vim.defer_fn(function()
                vim.cmd('source .vim') 
            end , 100)
        else
            if debug then
                table.insert(debug_Info, "no .vim on " .. tostring(vim.fn.getcwd()))
            end
        end
    end
})
