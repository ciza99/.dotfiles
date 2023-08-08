local M = {
	{
		"ciza99/poimandres.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme poimandres]])
		end,
	},

	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[colorscheme catppuccin-macchiato]])
	-- 	end,

	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[colorscheme gruvbox]])
	-- 	end,
	-- 	opts = {
	-- 		undercurl = true,
	-- 		underline = true,
	-- 		bold = true,
	-- 		italic = {
	-- 			strings = false,
	-- 			comments = false,
	-- 			operators = false,
	-- 			folds = false,
	-- 		},
	-- 		strikethrough = true,
	-- 		invert_selection = false,
	-- 		invert_signs = false,
	-- 		invert_tabline = false,
	-- 		invert_intend_guides = false,
	-- 		inverse = true, -- invert background for search, diffs, statuslines and errors
	-- 		contrast = "", -- can be "hard", "soft" or empty string
	-- 		palette_overrides = {},
	-- 		overrides = {},
	-- 		dim_inactive = false,
	-- 		transparent_mode = false,
	-- 	},
	-- },
}

return M
