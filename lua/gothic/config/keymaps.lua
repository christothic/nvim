local utils = vim.g.user_utils
local M = {}

M.set_default_keys = function()
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "
    vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
    vim.keymap.set(
        "n",
        "<leader>rb",
        "yb:%s/<C-r>0//g<Left><Left>",
        { desc = "Replace previous word" }
    )
    vim.keymap.set(
        "n",
        "<leader>re",
        "ye:%s/<C-r>0//g<Left><Left>",
        { desc = "Replace next end of word" }
    )
    vim.keymap.set(
        "n",
        "<leader>rw",
        "yiw:%s/<C-r>0//g<Left><Left>",
        { desc = "Replace inner word" }
    )
    vim.keymap.set(
        "n",
        "<leader>rW",
        "yiW:%s/<C-r>0//g<Left><Left>",
        { desc = "Replace inner WORD" }
    )
    vim.keymap.set("v", "<leader>r", "y:%s/<C-r>0//g<Left><Left>", { desc = "Replace selection" })

    -- TIP: Disable arrow keys in normal mode
    -- vim.keymap.set('i', '<C-h>', '<Left>')
    -- vim.keymap.set('i', '<C-l>', '<right>')
    -- vim.keymap.set('i', '<C-k>', '<up>')
    -- vim.keymap.set('i', '<C-j>', '<down>')

    vim.keymap.set(
        { "n", "v" },
        "<leader>ow",
        "<cmd>vs<CR>",
        { desc = "Split current file vertically" }
    )
    vim.keymap.set({ "n", "v" }, '<leader>"', 'ci"', { desc = 'Change inside " string' })
    vim.keymap.set({ "n", "v" }, "<leader>'", "ci'", { desc = "Change inside ' string" })
    -- vim.keymap.set("n", '<leader>o"', 'yi":vs <C-r>', { desc = "Replace inner WORD" })

    vim.keymap.set("n", "<leader>ofv", function()
        vim.fn.setreg("0", "")
        utils.send('yi"')
        vim.defer_fn(function()
            if vim.fn.getreg("0") == "" then utils.send("yi<") end
            vim.defer_fn(function()
                if vim.fn.getreg("0") == "" then return end
                vim.defer_fn(function()
                    local cwd = vim.fn.expand("%:p")
                    local dashtr = vim.fn.has("win32") and "\\" or "/"
                    local path = cwd:sub(1, cwd:find(dashtr .. "[^" .. dashtr .. "]*$"))
                        .. vim.fn.getreg("0"):gsub("/", dashtr)
                    if utils.does_file_exists(path) then
                        vim.cmd("vs " .. path)
                    else
                        vim.cmd("vs")
                        vim.cmd("Telescope find_files")
                        utils.send(vim.fn.getreg("0"):gsub("/", ""))
                    end
                end, 1)
            end, 1)
        end, 1)
        -- vim.defer_fn(function()
        --     local cwd = vim.fn.expand("%:p")
        --     local dashtr = vim.fn.has("win32") and "\\" or "/"
        --     local path = cwd:sub(1, cwd:find(dashtr .. "[^" .. dashtr .. "]*$"))
        --         .. vim.fn.getreg("0"):gsub("/", dashtr)
        --     if utils.does_file_exists(path) then
        --         vim.cmd("vs " .. path)
        --     else
        --         vim.cmd("vs")
        --         vim.cmd("Telescope find_files")
        --         utils.send(vim.fn.getreg("0"):gsub("/", ""))
        --     end
        -- end, 1)
    end, { desc = "Split file under cursor vertically" })
    -- vim.keymap.set({ "n", "v" }, "<left>", "<cmd>echo 'Use h to move!!'<CR>")
    -- vim.keymap.set({ "n", "v" }, "<right>", "<cmd>echo 'Use l to move!!'<CR>")
    -- vim.keymap.set({ "n", "v" }, "<up>", "<cmd>echo 'Use k to move!!'<CR>")
    -- vim.keymap.set({ "n", "v" }, "<down>", "<cmd>echo 'Use j to move!!'<CR>")

    -- Undo breaks
    vim.keymap.set("i", "<Space>", "<Space><C-g>u")
    vim.keymap.set("i", "<Tab>", "<Tab><C-g>u")
    vim.keymap.set("i", "<CR>", "<CR><C-g>u")
    -- Keybinds to make split navigation easier.
    --  Use CTRL+<hjkl> to switch between windows
    --
    --  See `:help wincmd` for a list of all window commands
    vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
    vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
    vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
    vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

    vim.keymap.set({ "n", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
    vim.keymap.set("i", "<C-s>", "<cmd>w<CR><ESC>", { desc = "Save file" })
    vim.keymap.set("i", "<C-z>", "<ESC>", { desc = "Exit insert mode" })

    -- vim.keymap.set("i", "<c-j>", "j", { desc = "Exit insert mode" })
    -- vim.keymap.set("i", "<c-k>", "k", { desc = "Exit insert mode" })
    -- vim.keymap.set("i", "<c-h>", "h", { desc = "Exit insert mode" })
    -- vim.keymap.set("i", "<c-l>", "l", { desc = "Exit insert mode" })
    -- vim.keymap.set("i", "jj", "<ESC>jl", { desc = "Exit insert mode", noremap = false })
    -- vim.keymap.set("i", "kk", "<ESC>kl", { desc = "Exit insert mode", noremap = false })
    -- vim.keymap.set("i", "hh", "<ESC>hh", { desc = "Exit insert mode", noremap = false })
    -- vim.keymap.set("i", "ll", "<ESC>ll", { desc = "Exit insert mode", noremap = false })
    -- vim.keymap.set({ "n", "v" }, "<C-z>", "<cmd><ESC><CR>", { desc = "Undo" })
    -- vim.keymap.set({ "n", "v" }, "<C-S-Z>", "<cmd>redo<CR>", { desc = "Redo" })
    -- vim.keymap.set({ "n", "v" }, "<C-S-z>", "<cmd>redo<CR>", { desc = "Redo" })
    -- vim.keymap.set({ "n", "v" }, "<M-z>", "<cmd>redo<CR>", { desc = "Redo" })
    -- vim.keymap.set({ "n", "v" }, "<C-M-Z>", "<cmd>redo<CR>", { desc = "Redo" })
    -- vim.keymap.set({ "n", "v" }, "<C-Z>", "<cmd>redo<CR>", { desc = "Redo" })
    -- vim.keymap.set({ "n", "v" }, "<C-r>", "<cmd>redo<CR>", { desc = "Redo" })

    -- Undo Tree
    vim.keymap.set("n", "<leader>u", function()
        vim.cmd("UndotreeToggle")
    end, { desc = "Toggle undo tree" })
    vim.keymap.set(
        "n",
        "<leader>U",
        "<cmd>UndotreePersistUndo<CR>",
        { desc = "Toggle persistant undo tree" }
    )

    -- Bar bar
    vim.keymap.set("n", "<tab>", "<Cmd>BufferNext<CR>", { desc = "Next buffer" })
    vim.keymap.set("n", "<S-tab>", "<Cmd>BufferPrevious<CR>", { desc = "Previous buffer" })
    vim.keymap.set("n", "<C-tab>", "<Cmd>BufferPrevious<CR>", { desc = "Previous buffer" })
    vim.keymap.set("n", "<leader>q", "<cmd>BufferClose<CR>", { desc = "Quit Current Buffer" })

    -- Terminal stuff
    vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })
    vim.keymap.set("n", "<leader>ot", "<cmd>ToggleTerm<CR>", { desc = "Open new terminal" })

    -- Manage keys
    -- Neo tree
    vim.keymap.set("n", "<leader>mg", "<cmd>Neotree float git_status<CR>", { desc = "Manage Git" })
    vim.keymap.set("n", "<leader>mp", "<cmd>Lazy<CR>", { desc = "Manage Plugins" })
    -- vim.keymap.set("n", "<leader>ml", "<cmd>Mason<CR>", { desc = "Manage LSPs" })
    -- vim.keymap.set("n", "<f10>", "<cmd>Mason<CR>", { desc = "Manage LSPs" })
    vim.keymap.set("n", "<leader>ml", function()
        -- if vim.lsp.inlay_hint.is_enabled(0) then
        --     vim.lsp.inlay_hint.enable(0, false)
        -- else
        vim.lsp.inlay_hint.enable(true)
        -- end
    end)
end

M.set_lsp_keys = function() end

M.set_debugger_keys = function(dap)
    -- local dap = require("dap")
    vim.keymap.set("n", "<leader>4", function()
        dap.continue()
    end, { desc = "Start/Continue DAP" })
    vim.keymap.set("n", "<Leader>8", function()
        dap.toggle_breakpoint()
    end, { desc = "Toggle breakpoint" })
    vim.keymap.set("n", "<Leader>9", function()
        dap.step_over()
    end, { desc = "Step over" })
    vim.keymap.set("n", "<Leader>0", function()
        dap.step_into()
    end, { desc = "Step into" })
    vim.keymap.set("n", "<Leader>-", function()
        dap.step_out()
    end, { desc = "Step out" })
    vim.keymap.set("n", "<Leader>di", function()
        require("dap.ui.widgets").hover()
    end, { desc = "Inspect" })
    vim.keymap.set("n", "<Leader>dp", function()
        require("dap.ui.widgets").preview()
    end, { desc = "Preview" })
end

M.set_telescope_keys = function()
    -- Telescope
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
    vim.keymap.set("n", "<leader>fg", function()
        builtin.live_grep({
            --   grep_open_files = true,
            prompt_title = "Files grep",
        })
    end, { desc = "Files grep" })
    vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
    vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Find help tags" })
    vim.keymap.set(
        "n",
        "<leader>fc",
        "<cmd>Telescope neoclip<CR>",
        { desc = "Find clipboard history" }
    )
    vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Find recent files" })
    vim.keymap.set(
        "n",
        "<leader>fs",
        "<cmd>Telescope lsp_document_symbols<CR>",
        { desc = "Find symbols" }
    )
    vim.keymap.set("n", "<leader>ft", "<cmd>Telescope treesitter<CR>", { desc = "Find treesitter" })
    vim.keymap.set("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "Find marks" })
    vim.keymap.set(
        "n",
        "<leader>fd",
        "<cmd>Telescope lsp_definitions<CR>",
        { desc = "Find definitions" }
    )
    vim.keymap.set(
        "n",
        "<leader>fi",
        "<cmd>Telescope lsp_implementations<CR>",
        { desc = "Find implementations" }
    )
    vim.keymap.set(
        "n",
        "<leader>fr",
        "<cmd>Telescope lsp_references<CR>",
        { desc = "Find references" }
    )
    vim.keymap.set(
        "n",
        "<leader>fo",
        "<cmd>Telescope lsp_document_diagnostics<CR>",
        { desc = "Find document diagnostics" }
    )
    vim.keymap.set(
        "n",
        "<leader>fk",
        "<cmd>Telescope lsp_workspace_diagnostics<CR>",
        { desc = "Find workspace diagnostics" }
    )
    vim.keymap.set("n", "<leader>fw", "<cmd>Telescope workspaces<CR>", { desc = "Find workspaces" })
    vim.keymap.set("n", "<leader>fq", "<cmd>Telescope quickfix<CR>", { desc = "Find quickfix" })
    vim.keymap.set("n", "<leader>fl", "<cmd>Telescope loclist<CR>", { desc = "Find loclist" })

    --   vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    --   vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    --   vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    --   vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    --   vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    --   vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    --   vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    --   vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    --   vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    --   vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set("n", "<leader>f/", function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
            winblend = 10,
            previewer = false,
        }))
    end, { desc = "Find in current buffer" })
    -- Also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set("n", "<leader>f<leader>", function()
        builtin.live_grep({
            grep_open_files = true,
            prompt_title = "Find in Open Files",
        })
    end, { desc = "Find in Open Files" })
    -- Shortcut for searching your neovim configuration files
    -- vim.keymap.set("n", "<leader>fn", function() builtin.find_files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find in neovim files" })
    vim.keymap.set("n", "<leader>fv", function()
        builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "Find in neovim files" })
end

M.set_commenter_keys = function() end

M.set_completion_keys = function() end

M.set_explorer_keys = function() end

M.set_formater_keys = function() end

M.set_workspace_keys = function() end

return M
