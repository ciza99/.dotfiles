local M = {
	"jose-elias-alvarez/null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "jay-babu/mason-null-ls.nvim" },
	config = function()
		local null_ls = require("null-ls")
		local mason_null_ls = require("mason-null-ls")

		local formatting = null_ls.builtins.formatting -- to setup formatters
		local diagnostics = null_ls.builtins.diagnostics -- to setup linters
		local gitsigns = null_ls.builtins.code_actions.gitsigns -- to setup gitsigns

		-- to setup format on save
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		mason_null_ls.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"eslint_d",
				"ocamlformat",
			},
			automatic_installation = true,
		})

		null_ls.setup({
			sources = {
				--  to disable file types use
				--  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
				formatting.prettier,
				formatting.stylua,
				gitsigns,
				diagnostics.eslint_d.with({
					condition = function(utils)
						return utils.root_has_file(".eslintrc.js")
					end,
				}),
			},
			-- configure format on save
			on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									--  only use null-ls for formatting instead of lsp server
									return client.name == "null-ls"
								end,
								bufnr = bufnr,
							})
						end,
					})
				end
			end,
		})
	end,
}

return M
