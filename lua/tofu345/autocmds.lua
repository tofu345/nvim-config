local autocmd_group = vim.api.nvim_create_augroup("Formatting auto-commands", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.lua" },
	desc = "Auto-format Lua files after saving",
	callback = function()
		local filePath = vim.api.nvim_buf_get_name(0)
		vim.cmd(":silent !stylua '" .. filePath .. "'")
	end,
	group = autocmd_group,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.c" },
	desc = "Auto-format C files after saving",
	callback = function()
		local filePath = vim.api.nvim_buf_get_name(0)
		vim.cmd(":silent !clang-format --style='{BasedOnStyle: LLVM, IndentWidth: 4}' -i '" .. filePath .. "'")
	end,
	group = autocmd_group,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.py" },
	desc = "Auto-format Python after saving",
	callback = function()
		local filePath = vim.api.nvim_buf_get_name(0)
		vim.cmd(":silent !black '" .. filePath .. "'")
	end,
	group = autocmd_group,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.rs" },
	desc = "Auto-format Rust after saving",
	callback = function()
		local filePath = vim.api.nvim_buf_get_name(0)
		vim.cmd(":silent !rustfmt '" .. filePath .. "'")
	end,
	group = autocmd_group,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.go" },
	desc = "Auto-format Go after saving",
	callback = function()
		local filePath = vim.api.nvim_buf_get_name(0)
		vim.cmd(":silent !go fmt")
	end,
	group = autocmd_group,
})
