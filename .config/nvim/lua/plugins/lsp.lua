return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions

					local opts = { buffer = ev.buf, silent = true }
					local map = function(mode, key, action)
						vim.keymap.set(mode, key, action, opts)
					end

					map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action) -- see available code actions, in visual mode will apply to selection

					map("n", "<leader>rn", vim.lsp.buf.rename) -- smart rename

					map("n", "<leader>df", vim.diagnostic.open_float) -- show diagnostics for line

					map("n", "[d", vim.diagnostic.goto_prev) -- jump to previous diagnostic in buffer

					map("n", "]d", vim.diagnostic.goto_next) -- jump to next diagnostic in buffer

					map("n", "K", vim.lsp.buf.hover) -- show documentation for what is under cursor

					map("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
				end,
			})

			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig["html"].setup({
				capabilities = capabilities,
			})

			lspconfig["cssls"].setup({
				capabilities = capabilities,
				settings = {
					package_manager = "yarn",
				},
			})

			lspconfig["emmet_ls"].setup({
				capabilities = capabilities,
				filetypes = {
					"css",
					"html",
					"javascript",
					"javascriptreact",
					"less",
					"sass",
					"scss",
					"svelte",
					"pug",
					"typescriptreact",
					"vue",
				},
			})

			lspconfig["tailwindcss"].setup({
				capabilities = capabilities,
				settings = {
					tailwindCSS = {
						experimental = {
							classRegex = {
								{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
								{ "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
							},
						},
					},
				},
			})

			lspconfig["ts_ls"].setup({
				capabilities = capabilities,
			})

			lspconfig["eslint"].setup({
				capabilities = capabilities,
				filetypes = {
					"javascript",
					"javascript.jsx",
					"javascriptreact",
					"typescript",
					"typescript.tsx",
					"typescriptreact",
				},
			})

			lspconfig["rust_analyzer"].setup({
				capabilities = capabilities,
			})

			lspconfig["prismals"].setup({
				capabilities = capabilities,
			})

			lspconfig["lua_ls"].setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = {
							-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
							version = "LuaJIT",
						},
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { "vim" },
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = vim.api.nvim_get_runtime_file("", true),
						},
						-- Do not send telemetry data containing a randomized but unique identifier
						telemetry = {
							enable = false,
						},
					},
				},
			})

			-- lspconfig["ocamllsp"].setup({
			-- 	cmd = { "ocamllsp" },
			-- 	filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
			-- 	root_dir = lspconfig.util.root_pattern(
			-- 		"*.opam",
			-- 		"esy.json",
			-- 		"package.json",
			-- 		".git",
			-- 		"dune-project",
			-- 		"dune-workspace"
			-- 	),
			-- 	on_attach = on_attach,
			-- 	capabilities = capabilities,
			-- })
		end,
	},
}
