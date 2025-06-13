return {
	{ "christoomey/vim-tmux-navigator", lazy = false },
	{
		"echasnovski/mini.ai",
		opts = { n_lines = 500 },
	},
	{
		"echasnovski/mini.comment",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		opts = {
			-- tsx, jsx, html, ...
			custom_commentstring = function()
				require("ts_context_commentstring.internal").calculate_commentstring({
					key = "commentstring" or vim.bo.commentstring,
				})
			end,
		},
	},
	{
		"echasnovski/mini.operators",
		opts = {},
	},
	{
		"echasnovski/mini.pairs",
		opts = {},
	},
	{
		"echasnovski/mini.indentscope",
		config = function()
			local indent = require("mini.indentscope")
			indent.setup({
				draw = {
					delay = 0,
					animation = indent.gen_animation.none(),
				},
			})
		end,
	},
	-- {
	-- 	"echasnovski/mini.files",
	-- 	opts = {},
	-- 	config = function(opts)
	-- 		require("mini.files").setup(opts)
	--
	-- 		local map = vim.keymap.set
	-- 		map("n", "<leader>e", ":lua MiniFiles.open()<CR>", { silent = true, noremap = true, desc = "Open Files" })
	-- 	end,
	-- },
	{
		"echasnovski/mini.surround",
		opts = {},
	},
	{
		"echasnovski/mini.splitjoin",
		config = function()
			local splitjoin = require("mini.splitjoin")
			splitjoin.setup({
				mappings = {
					toggle = "",
				},
			})

			vim.keymap.set({ "n", "x" }, "gsj", function()
				splitjoin.join()
			end, { noremap = true, silent = true, desc = "Join args" })

			vim.keymap.set({ "n", "x" }, "gsk", function()
				splitjoin.split()
			end, { noremap = true, silent = true, desc = "Split args" })
		end,
	},
	{
		"laytan/cloak.nvim",
		opts = {
			enabled = true,
			cloak_character = "*",
			-- The applied highlight group (colors) on the cloaking, see `:h highlight`.
			highlight_group = "Comment",

			-- Applies the length of the replacement characters for all matched
			-- patterns, defaults to the length of the matched pattern.
			cloak_length = nil, -- Provide a number if you want to hide the true length of the value.
			-- Wether it should try every pattern to find the best fit or stop after the first.
			try_all_patterns = true,
			patterns = {
				{
					-- Match any file starting with '.env'.
					-- This can be a table to match multiple file patterns.
					file_pattern = ".env*",
					-- Match an equals sign and any character after it.
					-- This can also be a table of patterns to cloak,
					-- example: cloak_pattern = { ':.+', '-.+' } for yaml files.
					cloak_pattern = "=.+",
				},
			},
		},
	},
}
