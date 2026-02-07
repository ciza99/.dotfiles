return {
	{ "petertriho/nvim-scrollbar", event = "VeryLazy", opts = {} },
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {
			user_default_options = {
				names = false,
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local colors = require("kanagawa.colors").setup().theme

			require("lualine").setup({
				options = {
					component_separators = "",
					section_separators = "",
					theme = {
						normal = { c = { fg = colors.ui.fg, bg = colors.ui.bg } },
						inactive = { c = { fg = colors.ui.fg, bg = colors.ui.bg } },
					},
				},
				sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {
						{
							"branch",
							icon = "",
							color = { gui = "bold" },
						},
						{
							"diff",
							symbols = { added = " ", modified = " ", removed = " " },
							diff_color = {
								added = { fg = colors.diff.add },
								modified = { fg = colors.diff.change },
								removed = { fg = colors.diff.delete },
							},
						},
						{
							"diagnostics",
							sources = { "nvim_diagnostic" },
							symbols = { error = " ", warn = " ", info = " " },
						},
						{
							function()
								return "%="
							end,
						},
					},
					lualine_x = { "location", "encoding", "filetype" },
					lualine_y = {},
					lualine_z = {},
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
				extensions = { "trouble" },
			})
		end,
	},
}
