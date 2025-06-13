vim.api.nvim_create_user_command("TSC", function(opts)
	-- Use the provided args or default to `tsc --noEmit`
	local cmd = opts.args ~= "" and opts.args or "tsc --noEmit"
	-- Format errors nicely so it works with quickfix list
	vim.opt.errorformat = "%f(%l\\,%c): %m"
	local output = vim.fn.systemlist(cmd)

	-- Clear and populate the quickfix list
	vim.fn.setqflist({}, " ", {
		title = "TypeScript Check",
		lines = output,
	})

	-- Open the quickfix list
	vim.cmd("copen")
end, {
	nargs = "?", -- optional argument (allows passing custom command)
	complete = "shellcmd", -- tab-completion for shell commands
})
