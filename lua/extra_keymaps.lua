--     "gF", "<cmd>e <cfile><cr>", function() :e <cfile><CR> end, desc = "",
-- FZF
vim.keymap.set({ 'n' }, "<leader>f", "", { desc = "FzF" })
vim.keymap.set({ 'n' }, "<leader>ff", ":Files<cr>", { desc = "FzF Files in working folder", })
vim.keymap.set({ 'n' }, "<leader>fi", ":GFiles<cr>", { desc = "FzF Files in git repo", })
vim.keymap.set({ 'n' }, "<leader>fd", ":GFiles?<cr>", { desc = "FzF Files with git differences", })
vim.keymap.set({ 'n' }, "<leader>fb", ":Buffers<cr>", { desc = "FzF Current buffers", })
vim.keymap.set({ 'n' }, "<leader>f0", ":Colors<cr>", { desc = "FzF Color Schemes", })
vim.keymap.set({ 'n' }, "<leader>fg", ":RG<cr>", { desc = "Grep Realtime Files in working folder", })
vim.keymap.set({ 'n' }, "<leader>f:", ":History:<cr>", { desc = "FzF Command History", })
vim.keymap.set({ 'n' }, "<leader>f/", ":History/<cr>", { desc = "FzF Search History", })
vim.keymap.set({ 'n' }, "<leader>fh", ":Helptags<cr>", { desc = "FzF all help tags", })
vim.keymap.set({ 'n' }, "<leader>f1", ":Maps<cr>", { desc = "FzF Normal Binds", })
vim.keymap.set({ 'n' }, "<leader>fc", ":Commands<cr>", { desc = "FzF Neovim commands", })
vim.keymap.set({ 'n' }, "<leader>fs", ":Snitppets<cr>", { desc = "FzF Snitppets", })
vim.keymap.set({ 'n' }, "<leader>fr", ":History<cr>", { desc = "FzF Recent opened files", })
vim.keymap.set({ 'n' }, "<leader>ft", ":Tags<cr>", { desc = "FzF Tags in working folder", })
vim.keymap.set({ 'n' }, "<leader>fT", ":BTags<cr>", { desc = "FzF Tags in current buffer", })
vim.keymap.set({ 'n' }, "<leader>fm", ":Marks<cr>", { desc = "FzF Marks in working folder", })
vim.keymap.set({ 'n' }, "<leader>fM", ":BMarks<cr>", { desc = "FzF Marks in current buffer", })
vim.keymap.set({ 'n' }, "<leader>fw", ":Windows<cr>", { desc = "FzF Windows", })
vim.keymap.set({ 'n' }, "<leader>fj", ":Jumps<cr>", { desc = "FzF Jumps", })
--     "<cmd>Lines<cr>", desc = "FzF Lines in loaded buffers",
--     "<cmd>Ag<cr>", desc = "awk search",
--     "<cmd>Locate<cr>", desc = "Locate search output",
--     "<cmd>Commits<cr>", desc = "Git commits (requires fugitive.vim)",
--     "<cmd>BCommits<cr>", desc = "Git commits for the current buffer; visual-select lines to track changes in the range",
--     "<cmd>BLines<cr>", desc = "FzF Lines in current buffer",
--     "<cmd>Changes<cr>", desc = "FzF Change history in open buffers",

local dap = require("dap")
vim.keymap.set({ 'n' }, "<leader>d", "", { desc = "Debug" })
vim.keymap.set({ 'n' }, "<leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint", })
vim.keymap.set({ 'n' }, "<leader>dc", function() dap.continue() end, { desc = "Continue", })
vim.keymap.set({ 'n' }, "<leader>do", function() dap.step_over() end, { desc = "Step Over", })
vim.keymap.set({ 'n' }, "<leader>di", function() dap.step_into() end, { desc = "Step Into", })
vim.keymap.set({ 'n' }, "<leader>di", function() dap.step_into() end, { desc = "Step Into", })
vim.keymap.set({ 'n' }, "<leader>dl", function() require "osv".launch({ port = 8086 }) end, { desc = "Launch", })

local flash = require("flash")
vim.keymap.set({ "n", "x", "o" }, "s", function() flash.jump() end, { desc = "Flash" })
vim.keymap.set({ "n", "x", "o" }, "S", function() flash.treesitter() end, { desc = "Flash Treesitter" })
vim.keymap.set({ "o" }, "r", function() flash.remote() end, { desc = "Remote Flash" })
vim.keymap.set({ "o", "x" }, "R", function() flash.treesitter_search() end, { desc = "Treesitter Search" })
-- vim.keymap.set({ "c" }, "<c-s>", function() flash.toggle() end, { desc = "Toggle Flash Search" })

--UndoTree
vim.keymap.set({ 'n' }, '<leader>ut', vim.cmd.UndotreeToggle, { desc = "Open Undo History" })

--Oil nvim
vim.keymap.set({ "n" }, "_", ":Oil<cr>", { desc = "Open parent directory" })

--vim-floater
vim.keymap.set({ 'n' }, "\\\\", ":FloatermToggle<cr>", { desc = "FzF Floating Terminals", })
vim.keymap.set({ 'n' }, "\\n", ":FloatermNew<cr>", { desc = "FzF Floating Terminals", })
vim.keymap.set({ 'n' }, "\\[", ":FloatermNext<cr>", { desc = "FzF Floating Terminals", })
vim.keymap.set({ 'n' }, "\\]", ":FloatermPrev<cr>", { desc = "FzF Floating Terminals", })
vim.keymap.set({ 't' }, "\\\\", "<C-\\><C-n>:FloatermToggle<cr>", { desc = "FzF Floating Terminals", })
vim.keymap.set({ 't' }, "\\n", "<C-\\><C-n>:FloatermNew<cr>", { desc = "FzF Floating Terminals", })
vim.keymap.set({ 't' }, "\\[", "<C-\\><C-n>:FloatermNext<cr>", { desc = "FzF Floating Terminals", })
vim.keymap.set({ 't' }, "\\]", "<C-\\><C-n>:FloatermPrev<cr>", { desc = "FzF Floating Terminals", })
vim.keymap.set({ 'n' }, "<leader>fe", ":Floaterms<cr>", { desc = "FzF Floating Terminals", })

--Mini plugs
MiniFiles = MiniFiles
vim.keymap.set({ "n" }, "-", function() MiniFiles.open() end, { desc = "Open parent directory floating" })
MiniDiff = MiniDiff
vim.keymap.set({ "n" }, "<leader>sd", function() MiniDiff.toggle_overlay() end, { desc = "Show Diffs" })
