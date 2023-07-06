local M = {
	{ "petertriho/nvim-scrollbar", event = "VeryLazy", opts = {} },
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {},
	},
	{ "lukas-reineke/indent-blankline.nvim", opts = { show_current_context = true }, event = "BufReadPost" },
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local lualine = require("lualine")
			lualine.setup({
				options = {
					theme = "auto",
					section_separators = "",
					component_separators = "",
				},
				tabline = {},
				extensions = {},
			})
		end,
	},
}

return M
