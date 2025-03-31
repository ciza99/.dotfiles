return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	config = function(_, opts)
		local harpoon = require("harpoon")
		harpoon:setup(opts)

		-- keymaps
		local map = vim.keymap.set

		map("n", "<leader>ma", function()
			harpoon:list():add()
		end)

		map("n", "<leader>ml", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		-- generate keymaps for quick navigation from 1 to 9
		for _, idx in ipairs({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }) do
			vim.keymap.set("n", string.format("<space>%d", idx), function()
				harpoon:list():select(idx)
			end)
		end
	end,
}
