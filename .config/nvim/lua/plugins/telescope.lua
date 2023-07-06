local M = {
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local builtin = require("telescope.builtin")

			local function telescope_buffer_dir()
				return vim.fn.expand("%:p:h")
			end

			local fb_actions = require("telescope").extensions.file_browser.actions

			telescope.setup({
				defaults = {
					sorting_strategy = "ascending",
					layout_config = {
						prompt_position = "top",
					},
					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-p>"] = fb_actions.goto_parent_dir,
							["<C-n>"] = fb_actions.goto_cwd,

							["<C-w>"] = function()
								vim.cmd("normal vbd")
							end,
						},
						n = {
							["p"] = fb_actions.goto_parent_dir,
							["n"] = fb_actions.goto_cwd,

							["q"] = actions.close,
						},
					},
				},
				extensions = {
					file_browser = {
						-- disables netrw and use telescope-file-browser in its place
						hijack_netrw = true,
						mappings = {
							-- your custom insert mode mappings
							i = {
								["<C-j>"] = actions.move_selection_next,
								["<C-k>"] = actions.move_selection_previous,
							},
							n = {
								-- your custom normal mode mappings
								["/"] = function()
									vim.cmd("startinsert")
								end,
							},
						},
					},
				},
			})

			telescope.load_extension("file_browser")

			-- keymaps

			local map = vim.keymap.set

			map("n", "<leader>ff", function()
				builtin.find_files({
					no_ignore = false,
					hidden = true,
				})
			end)

			map("n", "<leader>fs", builtin.live_grep, {})
			map("n", "<leader>fb", builtin.buffers, {})
			map("n", "<leader>fh", builtin.help_tags, {})
			map("n", "<leader>fc", builtin.grep_string, {})
			map("n", "<leader>ft", builtin.treesitter, {})
			map("n", "<leader>fe", function()
				telescope.extensions.file_browser.file_browser({
					path = "%:p:h",
					cwd = telescope_buffer_dir(),
					respect_gitignore = false,
					hidden = true,
					grouped = true,
				})
			end)

			map("n", "<leader>gc", builtin.git_commits, {})
			map("n", "<leader>gfc", builtin.git_bcommits, {})
			map("n", "<leader>gb", builtin.git_branches, {})
			map("n", "<leader>gs", builtin.git_status, {})
			map("n", "<leader>gh", builtin.git_stash, {})

			telescope.load_extension("fzf")
		end,
	},
}

return M
