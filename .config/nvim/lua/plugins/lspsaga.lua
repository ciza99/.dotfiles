local M = {
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			local lspsaga = require("lspsaga")

			lspsaga.setup({
				scroll_preview = {
					scroll_down = "<C-j>",
					scroll_up = "<C-k>",
				},
				finder = {
					vsplit = "<C-v>",
					split = "<C-h>",
					keys = {
						toggle_or_open = "<CR>",
					},
				},
				definition = {
					edit = "<CR>",
					vsplit = "sv",
					split = "sh",
				},
				ui = {
					title = false,
				},
				lightbulb = {
					enable = false,
				},
				symbol_in_winbar = {
					enable = false,
				},
			})
		end,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
		},
	},
}

return M
