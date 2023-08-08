local M = {
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{ "vim-scripts/ReplaceWithRegister", event = "VeryLazy" },
	{ "christoomey/vim-tmux-navigator", lazy = false },
	{
		"norcalli/nvim-colorizer.lua",
		event = "VeryLazy",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},
	{ "windwp/nvim-ts-autotag", event = "VeryLazy" },
	{ "numToStr/Comment.nvim", event = "VeryLazy", opts = {} },
}

return M
