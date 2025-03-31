return {
	{ "petertriho/nvim-scrollbar", event = "VeryLazy", opts = {} },
	{
		"stevearc/dressing.nvim",
		opts = {
			input = {
				mappings = {
					n = {
						["q"] = "Close",
						["p"] = "HistoryPrev",
						["n"] = "HistoryNext",
					},
					i = {
						["<C-p>"] = "HistoryPrev",
						["<C-n>"] = "HistoryNext",
					},
				},
			},
		},
		event = "VeryLazy",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPost",
		main = "ibl",
		opts = {
			scope = { enabled = false },
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			theme = "catppuccin",
			options = {
				component_separators = "|",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_x = {
					{
						require("noice").api.statusline.mode.get,
						cond = require("noice").api.statusline.mode.has,
						color = { fg = "#ff9e64" },
					},
					{
						require("noice").api.status.command.get,
						cond = require("noice").api.status.command.has,
						color = { fg = "#ff9e64" },
					},
				},
				lualine_a = {
					{
						"buffers",
					},
				},
			},
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
			lsp = {
				hover = {
					silent = true,
				},
			},
			routes = {
				{
					filter = {
						event = "notify",
						find = "No information available",
					},
					opts = {
						skip = true,
					},
				},
			},
		},
	},
}
