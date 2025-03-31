return {
	{ "vim-scripts/ReplaceWithRegister", event = "VeryLazy" },
	{ "christoomey/vim-tmux-navigator", lazy = false },
	{
		"echasnovski/mini.nvim",
		config = function()
			local ai = require("mini.ai")

			ai.setup({ n_lines = 500 })

			local hipatterns = require("mini.hipatterns")
			hipatterns.setup({
				highlighters = {
					-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
					fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
					hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
					todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
					note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
					hex_color = hipatterns.gen_highlighter.hex_color(),
				},
			})

			local comment = require("mini.comment")
			comment.setup()
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			check_ts = true,
			ts_config = {
				lua = { "string" }, -- it will not add a pair on that treesitter node
				javascript = { "template_string" },
				java = false, -- don't check treesitter on java
			},
		},
		config = function(_, opts)
			local autopairs = require("nvim-autopairs")
			autopairs.setup(opts)

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")

			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
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
