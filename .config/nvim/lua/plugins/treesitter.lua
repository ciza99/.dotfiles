local M = {
	{ "nvim-treesitter/playground", event = "VeryLazy" },
	{ "p00f/nvim-ts-rainbow", event = "VeryLazy" },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufReadPost",
		dependencies = { "p00f/nvim-ts-rainbow" },
		opts = {
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			autopairs = { enable = true },
			autotag = { enable = true },
			rainbow = {
				-- rainbow is broken right now
				enable = false,
				disable = { "html" },
				extended_mode = false,
			},
			ensure_installed = "all",
			auto_install = true,
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}

return M
