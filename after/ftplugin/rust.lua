local bufnr = vim.api.nvim_get_current_buf()
local opts = { silent = true, buffer = bufnr }

vim.keymap.set("n", "<leader>ca", function()
	vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
	-- or vim.lsp.buf.codeAction() if you don't want grouping.
end, opts)

vim.keymap.set("n", "<C-k>", function()
	vim.cmd(":RustLsp hover actions")
end, opts)

vim.keymap.set("n", "<leader>r", function()
	vim.lsp.buf.rename()
end, opts)

vim.keymap.set("n", "<leader>vd", function()
	vim.diagnostic.open_float()
end, opts)
