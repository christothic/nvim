M = {}

M.set_default_keys = function()
    vim.g.mapleader = ' '
    vim.g.maplocalleader = ' '
    vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
    -- TIP: Disable arrow keys in normal mode
    vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
    vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
    vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
    vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
    -- vim.keymap.set('i', '<C-h>', '<Left>')
    -- vim.keymap.set('i', '<C-l>', '<right>')
    -- vim.keymap.set('i', '<C-k>', '<up>')
    -- vim.keymap.set('i', '<C-j>', '<down>')

    -- Keybinds to make split navigation easier.
    --  Use CTRL+<hjkl> to switch between windows
    --
    --  See `:help wincmd` for a list of all window commands
    vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
    vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
    vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
    vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
end

M.set_lsp_keys = function()
end

M.set_telescope_keys = function()
end

M.set_commenter_keys = function()
end

M.set_completion_keys = function()
end

M.set_explorer_keys = function()
end

M.set_formater_keys = function()
end

M.set_workspace_keys = function()
end

return M
