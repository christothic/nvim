return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
	},
	-- lazy = false,
	-- priority = 1000,
	config = function()
		-- luasnip setup
		local luasnip = require("luasnip")

		-- nvim-cmp setup
		local cmp = require("cmp")
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Up
				["<C-d>"] = cmp.mapping.scroll_docs(4), -- Down
				-- C-b (back) C-f (forward) for snippet placeholder navigation.
				--["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			},
		})
		-- local cmp = require("cmp")
		-- vim.opt.completeopt = { "menu", "menuone", "noselect" }
		-- cmp.setup({
		--     snippet = {
		--         expand = function(args)
		--           luasnip.lsp_expand(args.body)
		--         end,
		--       },
		--       mapping = cmp.mapping.preset.insert({
		--         ['<C-k>'] = cmp.mapping.scroll_docs(-4), -- Up
		--         ['<C-j>'] = cmp.mapping.scroll_docs(4), -- Down
		--         -- C-b (back) C-f (forward) for snippet placeholder navigation.
		--         ['<C-Space>'] = cmp.mapping.complete(),
		--         ['<CR>'] = cmp.mapping.confirm {
		--           behavior = cmp.ConfirmBehavior.Replace,
		--           select = true,
		--         },
		--         ['<Tab>'] = cmp.mapping(function(fallback)
		--           if cmp.visible() then
		--             cmp.select_next_item()
		--           elseif luasnip.expand_or_jumpable() then
		--             luasnip.expand_or_jump()
		--           else
		--             fallback()
		--           end
		--         end, { 'i', 's' }),
		--         ['<S-Tab>'] = cmp.mapping(function(fallback)
		--           if cmp.visible() then
		--             cmp.select_prev_item()
		--           elseif luasnip.jumpable(-1) then
		--             luasnip.jump(-1)
		--           else
		--             fallback()
		--           end
		--         end, { 'i', 's' }),
		--       }),
		--       sources = {
		--         { name = 'nvim_lsp' },
		--         { name = 'luasnip' },
		--       },
		-- 	-- snippet = {
		-- 	-- 	expand = function(args)
		-- 	-- 		require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		-- 	-- 	end,
		-- 	-- },
		-- 	-- window = {
		-- 	-- 	-- completion = cmp.config.window.bordered(),
		-- 	-- 	-- documentation = cmp.config.window.bordered(),
		-- 	-- },
		-- 	-- mapping = cmp.mapping.preset.insert({
		-- 	-- 	["<C-j>"] = cmp.mapping.scroll_docs(-4),
		-- 	-- 	["<C-k>"] = cmp.mapping.scroll_docs(4),
		-- 	-- 	["<C-Space>"] = cmp.mapping.complete(),
		-- 	-- 	["<C-e>"] = cmp.mapping.abort(),
		-- 	-- 	["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		-- 	-- }),
		-- 	-- sources = cmp.config.sources({
		-- 	-- 	{ name = "nvim_lsp" },
		-- 	-- 	{ name = "nvim_lua" },
		-- 	-- 	{ name = "luasnip" }, -- For luasnip users.
		-- 	-- 	-- { name = "orgmode" },
		-- 	-- }, {
		-- 	-- 	{ name = "buffer" },
		-- 	-- 	{ name = "path" },
		-- 	-- }),
		-- })

		-- cmp.setup.cmdline(":", {
		-- 	mapping = cmp.mapping.preset.cmdline(),
		-- 	sources = cmp.config.sources({
		-- 		{ name = "path" },
		-- 	}, {
		-- 		{ name = "cmdline" },
		-- 	}),
		-- })
	end,
	opts = {},
}
