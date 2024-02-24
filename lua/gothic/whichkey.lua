local wk = require("which-key")

vim.o.timeoutlen = 200

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
    ["<leader>e"] = { "<cmd>NvimTreeFocus<CR>", "Focus File Explorer" },
    ["<C-h>"] = { "<C-w>h", "Window left" },
    ["<C-l>"] = { "<C-w>l", "Window right" },
    ["<C-j>"] = { "<C-w>j", "Window down" },
    ["<C-k>"] = { "<C-w>k", "Window up" },
    ["<C-Left>"] = { "<C-w>h", "Window left" },
    ["<C-Right>"] = { "<C-w>l", "Window right" },
    ["<C-Down>"] = { "<C-w>j", "Window down" },
    ["<C-Up>"] = { "<C-w>k", "Window up" },
    ["<C-s>"] = { "<cmd>w<CR>", "Window up" },
    ["<tab>"] = { "<Cmd>BufferNext<CR>", "Next buffer" },
    ["<S-tab>"] = { "<Cmd>BufferPrevious<CR>", "Previous buffer" },
    ["<C-tab>"] = { "<Cmd>BufferPrevious<CR>", "Previous buffer" },
},  { mode = "n", prefix = "" }
)
wk.register({
    q = { "<cmd>NvimTreeClose<CR><cmd>mksession! .vim<CR><cmd>qa!<CR>", "Quit" },
    ["<C-q>"] = { "<cmd>NvimTreeClose<CR><cmd>mksession! .vim<CR><cmd>qa!<CR>", "Quit" },
    x = { "<cmd>qa!<CR>", "Quit without saving session" },
        -- w = { "<cmd>qw<CR>", "Save and quit" },

},  { mode = "n", prefix = "<C-q>" }
)

wk.register({
    ["<C-h>"] = { "<Left>", "Left" },
    ["<C-l>"] = { "<Right>", "Right" },
    ["<C-j>"] = { "<Down>", "Down" },
    ["<C-k>"] = { "<Up>", "Up" },
},  { mode = "i", prefix = "" }
)


-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1

--   f = {
--     name = "file", -- optional group name
--     -- f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
--     -- r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, buffer = 123 }, -- additional options for creating the keymap
--     n = { "New File" }, -- just a label. don't create any mapping
--     e = "Edit File", -- same as above
--     -- ["1"] = "which_key_ignore",  -- special label to hide it in the popup
--     -- b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
--   },