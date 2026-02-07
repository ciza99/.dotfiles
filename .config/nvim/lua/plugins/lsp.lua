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

					map("n", "[d", function()
						vim.diagnostic.jump({ count = -1, float = true })
					end) -- jump to previous diagnostic in buffer

					map("n", "]d", function()
						vim.diagnostic.jump({ count = 1, float = true })
					end) -- jump to next diagnostic in buffer

					map("n", "K", vim.lsp.buf.hover) -- show documentation for what is under cursor

					map("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
				end,
			})

			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lspconfig = require("lspconfig")

			vim.lsp.config("html", {
				capabilities = capabilities,
			})

			vim.lsp.config("cssls", {
				capabilities = capabilities,
				settings = {
					package_manager = "yarn",
				},
			})

			vim.lsp.config("emmet_ls", {
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

			vim.lsp.config("tailwindcss", {
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

			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
			})

			vim.lsp.config("eslint", {
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

			vim.lsp.config("rust_analyzer", {
				capabilities = capabilities,
			})

			vim.lsp.config("prismals", {
				capabilities = capabilities,
			})

			vim.lsp.config("lua_ls", {
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

			vim.lsp.config("zls", {
				capabilities = capabilities,
			})

			vim.lsp.config("postgres_lsp", {
				capabilities = capabilities,
			})

			vim.lsp.config("ocamllsp", {
				cmd = { "ocamllsp" },
				filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
				root_dir = lspconfig.util.root_pattern(
					"*.opam",
					"esy.json",
					"package.json",
					".git",
					"dune-project",
					"dune-workspace"
				),
				capabilities = capabilities,
			})

			vim.lsp.config("kotlin_lsp", {
				capabilities = capabilities,
				filetypes = { "kotlin" },
			})

			vim.lsp.enable({
				"html",
				"cssls",
				"emmet_ls",
				"tailwindcss",
				"ts_ls",
				"eslint",
				"rust_analyzer",
				"prismals",
				"lua_ls",
				"zls",
				"postgres_lsp",
				"kotlin_lsp",
				-- "ocamllsp",
			})
		end,
	},
}
