return {
	"mfussenegger/nvim-lint",
	opts = {},
	config = function()
		local lint_status, lint = pcall(require, "lint")
		if not lint_status then
			vim.notify("nvim-lint not found", vim.log.levels.ERROR)
			return
		end

		lint.linters_by_ft = {
			javascript = {
				"eslint_d",
			},
			typescript = {
				"eslint_d",
			},
			sql = {
				"sqlfluff",
			},
			-- Add more linters as needed
		}

		vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
