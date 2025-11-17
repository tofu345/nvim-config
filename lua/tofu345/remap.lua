local keymap = vim.keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap.set("t", "<C-[>", "<C-\\><C-n>")

keymap.set("n", "<C-S-@>", "<C-^>") -- Real programmers dvorak L :|

keymap.set("c", "<M-b>", "<S-Left>", { desc = "Command Mode: One Word Left" })
keymap.set("c", "<M-e>", "<S-Right>", { desc = "Command Mode: One Word Right" })

keymap.set("n", "s", '"_s')
keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without overwriting unnamed Register" })
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy into System Clipboard" }) -- next greatest remap ever : asbjornHaland

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Spellcheck
-- https://www.reddit.com/r/neovim/comments/1fwqc8t/comment/lqh201n/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
local spell_types = { "markdown" }
vim.opt.spell = false
vim.api.nvim_create_augroup("Spellcheck", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = "Spellcheck", -- Grouping the command for easier management
	pattern = spell_types, -- Only apply to these file types
	callback = function()
		-- ignore vim.lsp.buf.hover() windows
		if vim.bo.modifiable then
			vim.opt_local.spell = true -- Enable spellcheck for these file types
		end
	end,
	desc = "Enable spellcheck for defined filetypes", -- Description for clarity
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	group = vim.api.nvim_create_augroup("Tabstop4", {}),
	pattern = { "lua", "go", "make" },
	callback = function()
		vim.opt_local.tabstop = 4
	end,
	desc = "filetypes that want tabs as 4 spaces",
})
