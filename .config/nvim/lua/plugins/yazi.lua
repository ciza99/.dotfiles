---@type LazySpec
return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	dependencies = {
		-- check the installation instructions at
		-- https://github.com/folke/snacks.nvim
		"folke/snacks.nvim",
	},
	keys = {
		-- 👇 in this section, choose your own keymappings!
		{
			"<leader>e",
			mode = { "n", "v" },
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
		{
			-- Open in the current working directory
			"<leader>w",
			"<cmd>Yazi cwd<cr>",
			desc = "Open the file manager in nvim's working directory",
		},
		{
			"<leader>fl",
			"<cmd>Yazi toggle<cr>",
			desc = "Resume the last yazi session",
		},
	},
	---@type YaziConfig | {}
	opts = {
		-- if you want to open yazi instead of netrw, see below for more info
		open_for_directories = true,
		floating_window_scaling_factor = 1,
		keymaps = {
			show_help = "<c-h>",
			open_file_in_vertical_split = "|",
			open_file_in_horizontal_split = "_",
			open_file_in_tab = "<c-t>",
			grep_in_directory = "<c-s>",
			replace_in_directory = "<c-g>",
			cycle_open_buffers = "<tab>",
			copy_relative_path_to_selected_files = "<c-y>",
			send_to_quickfix_list = "<c-q>",
			change_working_directory = "<c-\\>",
			open_and_pick_window = "<c-o>",
		},
		integrations = {
			grep_in_directory = "snacks.picker",
			grep_in_selected_files = "snacks.picker",
			bufdelete_implementation = "snacks-if-available",
			picker_add_copy_relative_path_action = "snacks.picker",
		},
	},
	-- 👇 if you use `open_for_directories=true`, this is recommended
	init = function()
		-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
		-- vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
}
