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
			local putils = require("telescope.previewers.utils")

			local function telescope_buffer_dir()
				return vim.fn.expand("%:p:h")
			end

			local fb_actions = require("telescope").extensions.file_browser.actions

			telescope.setup({
				defaults = {
					sorting_strategy = "ascending",
					layout_config = {
						-- prompt_position = "top",
					},
					preview = {
						-- 1) Do not show previewer for certain files
						filetype_hook = function(filepath, bufnr, opts)
							-- you could analogously check opts.ft for filetypes
							local excluded = vim.tbl_filter(function(ending)
								return filepath:match(ending)
							end, {
								"%.env.*",
							})
							if not vim.tbl_isempty(excluded) then
								putils.set_preview_message(bufnr, opts.winid, "Sorry, I am not showing this")
								return false
							end
							return true
						end,
						-- 2) Truncate lines to preview window for too large files
						filesize_hook = function(filepath, bufnr, opts)
							local path = require("plenary.path"):new(filepath)
							-- opts exposes winid
							local height = vim.api.nvim_win_get_height(opts.winid)
							local lines = vim.split(path:head(height), "[\r]?\n")
							vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
						end,
					},
					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
						},
						n = {
							["q"] = actions.close,
						},
					},
				},
				extensions = {
					file_browser = {
						-- disables netrw and use telescope-file-browser in its place
						initial_mode = "normal",
						hijack_netrw = true,
						mappings = {
							i = {
								["<C-p>"] = fb_actions.goto_parent_dir,
							},
							n = {
								["p"] = fb_actions.goto_parent_dir,
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
