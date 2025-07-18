-- vim.g.maplocalleader = "\\"
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- :ec 'SAVED'<cr>
vim.keymap.set({'n', 'i', 'v'}, "<C-s>", "<cmd>stopinsert | w<cr>", { silent = true, desc = "Save File" })
vim.keymap.set({'n'}, "<C-k>", ":m .-2<cr>==", { silent = true, desc = "Move line up" })
vim.keymap.set({'n'}, "<C-j>", ":m .+1<cr>==", { silent = true, desc = "Move line down" }) vim.keymap.set({'i'}, "<C-k>", "<Esc>:m .-2<cr>==a", { silent = true, desc = "Move line up" })
vim.keymap.set({'i'}, "<C-j>", "<Esc>:m .+1<cr>==a", { silent = true, desc = "Move line down" })
vim.keymap.set({'v'}, "<C-k>", ":m '<-2<cr>gv=gv", { silent = true, desc = "Move selection up" })
vim.keymap.set({'v'}, "<C-j>", ":m '>+1<cr>gv=gv", { silent = true, desc = "Move selection down" })
vim.keymap.set({'v'}, "<", "<gv", { silent = true, desc = "Indent left" })
vim.keymap.set({'v'}, ">", ">gv", { silent = true, desc = "Indent right" })
vim.keymap.set({'n'}, "<Tab>", ":tabn<cr>", { silent = true, desc = "Go to the next Tab Page" })
vim.keymap.set({'n'}, "<S-Tab>", ":tabp<cr>", { silent = true, desc = "Go to the previous Tab Page" })
vim.keymap.set({'n'}, "<Esc>", ":noh<cr>", { silent = true })
vim.keymap.set({'n'}, "<leader>b", "", { desc = "Buffers" })
vim.keymap.set({'n'}, "<leader>bn", "<cmd>bnext<cr>", { desc = "Go to the next Buffer" })
vim.keymap.set({'n'}, "<leader>bp", "<cmd>bprevious<cr>", { desc = "Go to the previous Buffer" })
vim.keymap.set({'n'}, "<leader>ff", ":find ")
