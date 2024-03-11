M = {}

M.table_concat = function(t1,t2)
    for i=1,#t2 do
       t1[#t1+1] = t2[i]
    end
    return t1
 end

M.load_vim_session = function()
    local debug_info = vim.g.debug_info
    local session_file = vim.g.vim_session_filename
    local f = io.open(session_file, "r")
    if f ~= nil then
        io.close(f)
        table.insert(debug_info, "Found " .. session_file)
        vim.defer_fn(function() vim.cmd("source " .. session_file) end, 50)
    else
        table.insert(debug_info, "no " .. session_file .. " on " .. tostring(vim.fn.getcwd()))
    end
    vim.g.debug_info = debug_info
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
	local win = vim.api.nvim_open_win(buffer, true, opts)
	vim.api.nvim_buf_set_keymap(buffer, "n", "q", ":q<CR>", { noremap = true, silent = true })
end

M.log_current_buffers = function()
    local debug_info = vim.g.debug_info
	local buffer_to_close = nil
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		local buf_name = vim.api.nvim_buf_get_name(buf)
        local is_listed = vim.api.nvim_buf_get_option(buf, "buflisted")
        table.insert(
            debug_info,
            "Buf Num: "
                .. buf
                .. ", Buf Name: "
                .. buf_name
                .. ", Listed: "
                .. tostring(is_listed)
                .. ", t: "
                .. tostring(vim.bo[buf].readonly)
                .. ", cwd?: "
                .. tostring(buf_name == vim.fn.getcwd())
        )
		if buf_name == vim.fn.getcwd() then
			buffer_to_close = buf
		end
	end
	if buffer_to_close then
		vim.api.nvim_buf_delete(buffer_to_close, { force = true })
	end
    vim.g.debug_info = debug_info
end


return M