local M = {
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local cmp = require("cmp")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			mason.setup()
			mason_lspconfig.setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"tsserver",
					"html",
					"cssls",
					"tailwindcss",
					"emmet_ls",
					-- "ocamllsp",
				},
				automatic_installation = true,
			})

			local map = vim.keymap

			local on_attach = function(_, bufnr)
				local opts = { noremap = true, silent = true, buffer = bufnr }

				-- keybinds
				map.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts) -- show definition, references
				map.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- go to declaration
				map.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts) -- see definition and make edits in window
				map.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
				map.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
				map.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
				map.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
				map.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
				map.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
				map.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
				map.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
				map.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
				map.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts) -- see outline on right hand side

				map.set("n", "[e", function()
					require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
				end, opts)

				map.set("n", "]e", function()
					require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
				end, opts)
			end

			cmp.setup({
				sources = {
					{ name = "nvim_lsp" },
				},
			})

			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- change diagnostic symbols
			local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- CONFIGURE SERVERS

			lspconfig["html"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			lspconfig["cssls"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					package_manager = "yarn",
				},
			})

			lspconfig["emmet_ls"].setup({
				on_attach = on_attach,
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

			lspconfig["tsserver"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			lspconfig["eslint"].setup({
				on_attach = on_attach,
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
				on_attach = on_attach,
				capabilities = capabilities,
			})

			lspconfig["tailwindcss"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			lspconfig["prismals"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			lspconfig["lua_ls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
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

			lspconfig["ocamllsp"].setup({
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
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end,
	},
}

return M
