-- local nvimtreeapi = require("nvim-tree.api")

-- local function handle_cursor(left)
-- 	if left then
-- 		nvimtreeapi.node.navigate.parent_close()
-- 		return
-- 	end
-- 	local node = nvimtreeapi.tree.get_node_under_cursor()
-- 	if vim.fn.isdirectory(node.absolute_path) == 1 then
-- 		nvimtreeapi.node.open.edit()
-- 		vim.cmd("norm! j")
-- 	end
-- 	-- print(vim.fn.isdirectory(node.absolute_path)) -- and nvimtreeapi.tree.open()
-- end

-- require("nvim-tree").setup({
-- 	on_attach = function(bufnr)
-- 		local function opts(desc)
-- 			return {
-- 				desc = "nvim-tree: " .. desc,
-- 				buffer = bufnr,
-- 				noremap = true,
-- 				silent = true,
-- 				nowait = false,
-- 			}
-- 		end
-- 		nvimtreeapi.config.mappings.default_on_attach(bufnr)
-- 		vim.keymap.del("n", "<tab>", {
-- 			buffer = bufnr,
-- 		})
-- 		vim.keymap.set("n", "h", function()
-- 			handle_cursor(true)
-- 		end, opts("Close Directory"))
-- 		vim.keymap.set("n", "l", handle_cursor, opts("Open Directory"))
-- 		-- tree.get_node_under_cursor()
-- 	end,
-- 	actions = {
-- 		open_file = {
-- 			quit_on_open = true,
-- 		},
-- 	},
-- 	-- hijack_directories = {
-- 	--     enable = false,
-- 	--     auto_open = false
-- 	-- }
-- })

local wk = require("which-key")
local telescope = require("telescope.builtin")

local function gothicKeys()
	wk.register({
		q = { "<cmd>BufferClose<CR>", "Quit Current Buffer" },
		-- e = { "<cmd>NvimTreeFindFile<CR>", "Focus File Explorer" },
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
		w = {
			name = "Workspaces",
			o = { "<cmd>WorkspacesOpen<CR>", "Open workspace" },
			a = {
				function()
					local name = vim.fn.input("Workspace name and path (leave blank for current path as name): ")
					vim.cmd("WorkspacesAdd " .. name)
				end,
				"Add Workspace",
			},
			-- e = { function() telescope.file_browser() end, "Edit File" },
		},
		f = {
			name = "Telescope",
			f = {
				function()
					telescope.find_files()
				end,
				"Find Files",
			},
			g = {
				function()
					telescope.live_grep()
				end,
				"Find in Files",
			},
			w = { "<cmd>Telescope workspaces<CR>", "Find workspaces" },
			b = {
				function()
					telescope.buffers()
				end,
				"Find in Buffers",
			},
			h = {
				function()
					telescope.help_tags()
				end,
				"Help",
			},
			-- n = { function() telescope.file_browser() end, "New File" },
			-- e = { function() telescope.file_browser() end, "Edit File" },
		},
	}, { mode = "n", prefix = "<leader>" })
	wk.register({
		-- ["<C-e>"] = { "<cmd>NvimTreeToggle<CR>", "File Explorer" },
		["<C-h>"] = { "<C-w>h", "Window left" },
		["<C-l>"] = { "<C-w>l", "Window right" },
		["<C-j>"] = { "<C-w>j", "Window down" },
		["<C-k>"] = { "<C-w>k", "Window up", noremap = false },
		["<C-Left>"] = { "<C-w>h", "Window left" },
		["<C-Right>"] = { "<C-w>l", "Window right" },
		["<C-Down>"] = { "<C-w>j", "Window down" },
		["<C-Up>"] = { "<C-w>k", "Window up" },
		["<ESC>"] = { "<Cmd>nohl<CR>", "which_key_ignore", noremap = false },
		["<tab>"] = { "<Cmd>BufferNext<CR>", "Next buffer" },
		["<S-tab>"] = { "<Cmd>BufferPrevious<CR>", "Previous buffer" },
		["<C-tab>"] = { "<Cmd>BufferPrevious<CR>", "Previous buffer" },
		-- ["<C-p>"] = { function() print("your sis") end, "Previous buffer" },
		-- ["<C-Space>"] = {
		-- 	function()
		-- 		print("your sis")
		-- 	end,
		-- 	"Previous buffer",
		-- },
		-- ["<C-S-z>"] = { "<cmd>redo<CR>", "Redo"  },
		["<C-S-f>"] = {
			function()
				telescope.live_grep()
			end,
			"Find In Files",
		},
		-- ["<C-p>"] = {
		-- 	function()
		-- 		telescope.find_files()
		-- 	end,
		-- 	"Find Files",
		-- },
	}, { mode = "n", prefix = "" })

	wk.register({
		q = {
			function()
				-- nvimtreeapi.tree.close_in_all_tabs()
				-- nvimtreeapi.tree.close()
				vim.cmd("mksession! .vim")
				vim.cmd("qa!")
			end,
			"Quit",
		},
		["<C-q>"] = {
			function()
				-- nvimtreeapi.tree.close_in_all_tabs()
				-- nvimtreeapi.tree.close()
				vim.cmd("mksession! .vim")
				vim.cmd("qa!")
			end,
			"Quit",
		},
		x = { "<cmd>qa!<CR>", "Quit without saving session" },
		-- w = { "<cmd>qw<CR>", "Save and quit" },
	}, { mode = { "i", "n", "v" }, prefix = "<C-q>" })

	wk.register({
		["<C-h>"] = { "<Left>", "Left" },
		["<C-l>"] = { "<Right>", "Right" },
		["<C-j>"] = { "<Down>", "Down" },
		["<C-k>"] = { "<Up>", "Up" },
		["<C-r>"] = { "<cmd>redo<CR>", "Redo" },

		-- ["<Tab>"] = { "<cmd>"
		-- ["<C-e>"] = {
		-- 	function()
		-- 		-- vim.
		-- 		vim.lsp.buf.hover()
		-- 	end,
		-- 	"Enter buffer",
		-- },
		-- ["<C-Space>"] = {
		-- 	function()
		-- 		local a = require("cmp")
		-- 		a.mapping.complete()
		-- 	end,
		-- 	"Start autocomplete",
		-- },
		-- ["<C-e>"] = { function() require'cmp'.mapping.abort() end, "Abort autocompletion" },
		-- ["<C-CR>"] = { function() require'cmp'.mapping.confirm({ select = true }) end, "Confim autocompletion"},

		-- ["<C-s>"] = { "<cmd>w<CR>", "Save file" },
	}, { mode = "i", prefix = "" })

	wk.register({
		["<C-s>"] = { "<cmd>w<CR>", "Save file" },
		-- ["<C-c>"] = { "<cmd>y<CR>", "Copy" },
		-- ["<C-v>"] = { "<cmd>P<CR>", "Paste" },
		["<C-z>"] = { "<cmd>u<CR>", "Undo" },
		-- ["<C-p>"] = {
		-- 	function()
		-- 		telescope.find_files()
		-- 	end,
		-- 	"Find Files",
		-- },
	}, { mode = { "i", "n", "v" }, prefix = "" })
end

local function lspKeymaps(buf)
    -- vim.keymap.set("i", "<C-e>", vim.lsp.buf.hover, opts)
	-- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
	-- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
	-- vim.keymap.set("n", "<space>wl", function()
	-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, opts)
	-- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
	-- vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
	-- vim.keymap.set("n", "<space>f", function()
	-- 	vim.lsp.buf.format({ async = true })
	-- end, opts)
	wk.register({
        -- ["<space>f"] = {
        --     function()
        --         vim.lsp.buf.format({ async = true })
        --     end,
        --     "Format",
        -- },
        -- ["<space>ca"] = {
        --     function()
        --         vim.lsp.buf.code_action()
        --     end,
        --     "Code action",
        -- },
        -- ["<space>rn"] = {
        --     function()
        --         vim.lsp.buf.rename()
        --     end,
        --     "Rename",
        -- },
        -- ["<space>wl"] = {
        --     function()
        --         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        --     end,
        --     "List workspace folders",
        -- },
        -- ["<space>wr"] = {
        --     function()
        --         vim.lsp.buf.remove_workspace_folder()
        --     end,
        --     "Remove workspace folder",
        -- },
        -- ["<space>wa"] = {
        --     function()
        --         vim.lsp.buf.add_workspace_folder()
        --     end,
        --     "Add workspace folder",
        -- },
		K = {
			function()
				vim.lsp.buf.hover()
			end,
			"Go to hover",
		},
		["<C-k>"] = {
			function()
				vim.lsp.buf.signature_help()
			end,
			"Signature help",
		},
	}, { mode = { "n" }, prefix = "", buffer = buf })
	wk.register({
		D = {
			function()
				vim.lsp.buf.type_definition()
			end,
			"Go to type definition",
		},
	}, { mode = { "n" }, prefix = "<leader>", buffer = buf })
	wk.register({
		r = {
			function()
				vim.lsp.buf.references()
			end,
			"Go to references",
		},
		D = {
			function()
				vim.lsp.buf.declaration()
			end,
			"Go to declaration",
		},
		d = {
			function()
				vim.lsp.buf.definition()
			end,
			"Go to definition",
		},
		i = {
			function()
				vim.lsp.buf.implementation()
			end,
			"Go to implementation",
		},
	}, { mode = { "n" }, prefix = "g", buffer = buf })
end
local result = {
	gothicKeys = gothicKeys,
	lspKeymaps = lspKeymaps,
}

-- wk.register({
-- },  {mode = {"n", "v"}, prefix = "" }
-- )
-- wk.register({
--     ["<C-s>"] = { "<cmd>w<CR>", "Save file" },
--     ["<C-z>"] = { "<cmd>u<CR>", "Undo" },
--     ["<C-p>"] = { function() telescope.find_files() end, "Find Files" },
-- },  {mode = {"i", "n", "v"}, prefix = "" }
-- )
-- f = { function() telescope.find_files() end, "Find Files" },
-- g = { function() telescope.live_grep() end, "Find in Files" },
-- b = { function() telescope.buffers() end, "Find in Buffers" },
-- h = { function() telescope.help_tags() end, "Help" },
-- wk.register({
--     ["<C-s>"] = { "<cmd>w<CR>", "Save file" },
--     ["<C-z>"] = { "<cmd>u<CR>", "Undo" },
--     ["<C-S-Z>"] = { "<cmd>redo<CR>", "Save file" },
-- },  {mode = "n", prefix = "<C-p>" }
-- )

-- return nvimtreeapi
return result
