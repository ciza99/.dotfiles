local M = {
	{
		"L3MON4D3/LuaSnip",
		version = "1.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		build = "make install_jsregexp",
		event = "VeryLazy",
	},
	{
		"onsails/lspkind.nvim",
		event = "VeryLazy",
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = { "onsails/lspkind.nvim", "saadparwaiz1/cmp_luasnip", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path" },
		event = "VeryLazy",
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")

			vim.opt.completeopt = "menu,menuone,noselect"

			cmp.setup({
				formatting = {
					format = lspkind.cmp_format({
						mode = "Symbol",
						maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
						ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
						before = function(_, vim_item)
							return vim_item
						end,
					}),
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- for `luasnip` users.
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
					["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
					["<C-e>"] = cmp.mapping.abort(), -- close completion window
					["<CR>"] = cmp.mapping.confirm({ select = false }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- lsp
					{ name = "luasnip" }, -- snippets
					{ name = "path" }, -- file system paths
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}

return M
