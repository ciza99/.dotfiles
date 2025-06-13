return {
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"ThePrimeagen/git-worktree.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local layout_actions = require("telescope.actions.layout")
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
							["<C-t>"] = layout_actions.toggle_preview,
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-_>"] = actions.select_horizontal,
							["<C-|>"] = actions.select_vertical,
						},
						n = {
							["<C-t>"] = layout_actions.toggle_preview,
							["q"] = actions.close,
							["_"] = actions.select_horizontal,
							["|"] = actions.select_vertical,
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
			telescope.load_extension("git_worktree")

			-- keymaps

			local map = vim.keymap.set

			map("n", "<leader><leader>", function()
				builtin.find_files({
					hidden = true,
				})
			end)

			-- resume last opened cached picker
			map("n", "<leader>fl", builtin.resume, {})
			-- list alf cached pickers
			map("n", "<leader>fp", builtin.pickers, {})

			map("n", "<leader>fw", telescope.extensions.git_worktree.git_worktrees, {})
			map("n", "<leader>nw", telescope.extensions.git_worktree.create_git_worktree, {})

			map("n", "<leader>fh", ":Telescope harpoon marks<CR>", { desc = "[H]arpoon Marks" })
			map("n", "<leader>fm", builtin.marks, { desc = "[M]arks" })
			map("n", "<leader>/", builtin.current_buffer_fuzzy_find, {})
			map("n", "<leader>fs", builtin.live_grep, {})
			map("n", "<leader>fb", builtin.buffers, {})
			map("n", "<leader>f?", builtin.help_tags, {})
			map("n", "<leader>fc", builtin.grep_string, {})
			map("n", "<leader>ft", builtin.treesitter, {})
			map("n", "<leader>fa", builtin.commands, {})
			map("n", "<leader>fq", builtin.quickfix, {})
			map("n", "<leader>fe", function()
				telescope.extensions.file_browser.file_browser({
					path = "%:p:h",
					cwd = telescope_buffer_dir(),
					hidden = true,
					grouped = true,
				})
			end)

			map("n", "<leader>gC", builtin.git_commits, {})
			map("n", "<leader>gB", builtin.git_bcommits, {})
			map("n", "<leader>gb", builtin.git_branches, {})
			map("n", "<leader>gs", builtin.git_status, {})
			map("n", "<leader>gh", builtin.git_stash, {})

			telescope.load_extension("fzf")
		end,
	},
}
