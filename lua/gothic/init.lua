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

-- -- Set up an autocmd to run the function after VimEnter
-- vim.api.nvim_create_autocmd("VimEnter", {
--     callback = scanAllBuffers
-- })


local function showBuffersInFloatingWindow()
    local buffers = {}
    local buffer_to_close = nil
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        --if vim.api.nvim_buf_is_loaded(buf) then
        local buf_name = vim.api.nvim_buf_get_name(buf)
        if debug then
            print("Buffer Number: " .. buf)
            local is_listed = vim.api.nvim_buf_get_option(buf, 'buflisted')
            table.insert(buffers, "Buf Num: " .. buf .. ", Buf Name: " .. buf_name .. 
            ", Listed: " .. tostring(is_listed) .. ", t: " .. tostring(vim.bo[buf].readonly) ..
            ", cwd?: " .. tostring(buf_name == vim.fn.getcwd()))
        end
        if buf_name == vim.fn.getcwd() then
            buffer_to_close = buf
        end
    end
    -- Create a buffer for the floating window
    if debug then
        local buffer = vim.api.nvim_create_buf(false, true)
        -- Set lines of the buffer
        vim.api.nvim_buf_set_lines(buffer, 0, -1, false, buffers)
        -- Define the floating window size and position
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
        -- Create the floating window
        local win = vim.api.nvim_open_win(buffer, true, opts)  
        -- Set an autocmd to close the window on pressing q
        vim.api.nvim_buf_set_keymap(buffer, 'n', 'q', ':q<CR>', {noremap = true, silent = true})
    end
    if buffer_to_close then
        vim.api.nvim_buf_delete(buffer_to_close, {force = true})
    end
    -- vim.defer_fn(function()
    -- end, 2000)
end

-- Set up an autocmd to run the function after VimEnter
vim.api.nvim_create_autocmd("VimEnter", {
    callback = showBuffersInFloatingWindow
})
