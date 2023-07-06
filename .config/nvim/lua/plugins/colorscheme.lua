local M = {
	{ "p00f/nvim-ts-rainbow", event = "VeryLazy" },
	{
		"ciza99/poimandres.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme poimandres]])
		end,
	},
}

return M
