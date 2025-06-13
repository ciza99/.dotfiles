return {
	{ "petertriho/nvim-scrollbar", event = "VeryLazy", opts = {} },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local clients_lsp = function()
				local bufnr = vim.api.nvim_get_current_buf()

				local clients = vim.lsp.get_clients()
				if next(clients) == nil then
					return ""
				end

				local c = {}
				for _, client in pairs(clients) do
					table.insert(c, client.name)
				end
				return " " .. table.concat(c, "|")
			end

			require("lualine").setup({
				options = {
					component_separators = "",
					section_separators = { left = "", right = "" },
					disabled_filetypes = { "alpha", "Outline" },
				},
				sections = {
					lualine_a = {
						{ "mode", separator = { left = " ", right = "" }, icon = "󱠇" },
					},
					lualine_b = {
						{
							"filetype",
							icon_only = true,
							padding = { left = 1, right = 0 },
						},
						"filename",
					},
					lualine_c = {
						{
							"branch",

							icon = "",
						},
						{

							"diff",
							symbols = { added = " ", modified = " ", removed = " " },
							colored = false,
						},
					},
					lualine_x = {
						{
							"diagnostics",
							symbols = { error = " ", warn = " ", info = " ", hint = " " },
							update_in_insert = true,
						},
					},
					lualine_y = { clients_lsp },
					lualine_z = {
						{ "location", separator = { left = "", right = " " }, icon = "" },
					},
				},
				inactive_sections = {
					lualine_a = { "filename" },
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = { "location" },
				},
				extensions = { "trouble" },
			})
		end,
	},
	-- {
	-- 	"folke/noice.nvim",
	-- 	event = "VeryLazy",
	-- 	dependencies = {
	-- 		"MunifTanjim/nui.nvim",
	-- 	},
	-- 	opts = {
	-- 		-- you can enable a preset for easier configuration
	-- 		presets = {
	-- 			bottom_search = false, -- use a classic bottom cmdline for search
	-- 			command_palette = true, -- position the cmdline and popupmenu together
	-- 			long_message_to_split = true, -- long messages will be sent to a split
	-- 			inc_rename = false, -- enables an input dialog for inc-rename.nvim
	-- 			lsp_doc_border = false, -- add a border to hover docs and signature help
	-- 		},
	-- 		messages = {
	-- 			view = "mini",
	-- 			view_error = "mini",
	-- 			view_warn = "mini",
	-- 			view_history = "mini",
	-- 			view_search = "mini",
	-- 		},
	-- 		notify = {
	-- 			-- Noice can be used as `vim.notify` so you can route any notification like other messages
	-- 			-- Notification messages have their level and other properties set.
	-- 			-- event is always "notify" and kind can be any log level as a string
	-- 			-- The default routes will forward notifications to nvim-notify
	-- 			-- Benefit of using Noice for this is the routing and consistent history view
	-- 			enabled = true,
	-- 			view = "mini",
	-- 		},
	-- 		lsp = {
	-- 			message = {
	-- 				-- Messages shown by lsp servers
	-- 				enabled = true,
	-- 				view = "mini",
	-- 			},
	-- 			hover = {
	-- 				silent = true,
	-- 			},
	-- 			override = {
	-- 				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
	-- 				["vim.lsp.util.stylize_markdown"] = true,
	-- 			},
	-- 		},
	-- 		views = {
	-- 			cmdline_popup = {
	-- 				border = {
	-- 					style = "none",
	-- 					padding = { 1, 1 },
	-- 				},
	-- 				filter_options = {},
	-- 				win_options = {
	-- 					winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
	-- 				},
	-- 			},
	-- 			mini = {
	-- 				align = "center",
	-- 				position = {
	-- 					-- Centers messages top to bottom
	-- 					row = "95%",
	-- 					-- Aligns messages to the far right
	-- 					col = "100%",
	-- 				},
	-- 			},
	-- 		},
	-- 		routes = {
	-- 			{
	-- 				filter = {
	-- 					event = "notify",
	-- 					find = "No information available",
	-- 				},
	-- 				opts = {
	-- 					skip = true,
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- },
}
