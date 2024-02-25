local nvimtreeapi = require "nvim-tree.api"

require("nvim-tree").setup {
    on_attach = function(bufnr)
        local function opts(desc)
            return {
                desc = "nvim-tree: " .. desc,
                buffer = bufnr,
                noremap = true,
                silent = true,
                nowait = false
            }
        end
        nvimtreeapi.config.mappings.default_on_attach(bufnr)
        vim.keymap.del('n', '<tab>', {
            buffer = bufnr
        })
    end,
    -- hijack_directories = {
    --     enable = false,
    --     auto_open = false
    -- }
}

local wk = require("which-key")
wk.register({
    m = {
        name = "Manage",
        p = { "<cmd>Lazy<CR>", "Plugins" },
        c = { 
            name = "Colors",
            ["1"] = { "<cmd>colorscheme tokyonight<CR>", "Tokio Night" },
            ["2"] = { "<cmd>colorscheme tokyonight-moon<CR>", "Tokio Moon" },
            ["3"] = { "<cmd>colorscheme tokyonight-night<CR>", "Tokio Night Night" },
            ["4"] = { "<cmd>colorscheme tokyonight-storm<CR>", "Tokio Storm" },
        },
    },

}, { mode = "n", prefix = "<leader>" }
)
wk.register({
    -- ["<C-e>"] = { "<cmd>NvimTreeToggle<CR>", "File Explorer" },
    ["<leader>e"] = { "<cmd>NvimTreeFindFile<CR>", "Focus File Explorer" },
    ["<C-h>"] = { "<C-w>h", "Window left" },
    ["<C-l>"] = { "<C-w>l", "Window right" },
    ["<C-j>"] = { "<C-w>j", "Window down" },
    ["<C-k>"] = { "<C-w>k", "Window up" },
    ["<C-Left>"] = { "<C-w>h", "Window left" },
    ["<C-Right>"] = { "<C-w>l", "Window right" },
    ["<C-Down>"] = { "<C-w>j", "Window down" },
    ["<C-Up>"] = { "<C-w>k", "Window up" },
    -- ["<C-s>"] = { "<cmd>w<CR>", "Save file" },
    ["<tab>"] = { "<Cmd>BufferNext<CR>", "Next buffer" },
    ["<S-tab>"] = { "<Cmd>BufferPrevious<CR>", "Previous buffer" },
    ["<C-tab>"] = { "<Cmd>BufferPrevious<CR>", "Previous buffer" },
},  { mode = "n", prefix = "" }
)
-- "<cmd>NvimTreeClose<CR><cmd>mksession! .vim<CR><cmd>qa!<CR>",
wk.register({
    q  = { function()
        nvimtreeapi.tree.close_in_all_tabs()
        nvimtreeapi.tree.close()
        vim.cmd("mksession! .vim")
        vim.cmd("qa!")
    end, "Quit" },
    ["<C-q>"] = { function()
        nvimtreeapi.tree.close_in_all_tabs()
        nvimtreeapi.tree.close()
        vim.cmd("mksession! .vim")
        vim.cmd("qa!")
    end, "Quit" },
    x = { "<cmd>qa!<CR>", "Quit without saving session" },
        -- w = { "<cmd>qw<CR>", "Save and quit" },
},  { mode = {"i", "n", "v"}, prefix = "<C-q>" }
)

wk.register({
    ["<C-h>"] = { "<Left>", "Left" },
    ["<C-l>"] = { "<Right>", "Right" },
    ["<C-j>"] = { "<Down>", "Down" },
    ["<C-k>"] = { "<Up>", "Up" },
    -- ["<C-s>"] = { "<cmd>w<CR>", "Save file" },
},  { mode = "i", prefix = "" }
)

wk.register({
    ["<C-s>"] = { "<cmd>w<CR>", "Save file" },
},  {mode = {"i", "n", "v"}, prefix = "" }
)

return nvimtreeapi