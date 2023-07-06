local M = {
	{ "nvim-treesitter/playground", event = "VeryLazy" },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufReadPost",
		dependencise = { "p00f/nvim-ts-rainbow" },
		opts = {
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			autopairs = { enable = true },
			autotag = { enable = true },
			rainbow = {
				enable = true,
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
