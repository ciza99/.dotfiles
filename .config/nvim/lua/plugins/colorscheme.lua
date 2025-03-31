return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = { flavor = "mocha", no_italic = true },
		config = function(_, opts)
			require("catppuccin").setup(opts)

			vim.cmd([[colorscheme catppuccin]])
		end,
	},

	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[colorscheme kanagawa]])
	-- 	end,
	-- },

	-- {
	-- 	"oxfist/night-owl.nvim",
	-- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		vim.cmd([[colorscheme night-owl]])
	-- 	end,
	-- },

	-- {
	-- 	"bluz71/vim-nightfly-guicolors",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[colorscheme nightfly]])
	-- 	end,
	-- },

	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- 	config = function()
	-- 		vim.cmd([[colorscheme tokyonight]])
	-- 	end,
	-- },

	-- {
	-- 	"ciza99/poimandres.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[colorscheme poimandres]])
	-- 	end,
	-- },

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
