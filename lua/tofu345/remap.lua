local keymap = vim.keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap.set("n", "<C-S-@>", "<C-^>") -- Real programmers dvorak L :|

keymap.set("c", "<M-b>", "<S-Left>", { desc = "Command Mode: One Word Left" })
keymap.set("c", "<M-e>", "<S-Right>", { desc = "Command Mode: One Word Right" })

keymap.set("n", "s", [["_s]])
keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without overwriting unnamed Register" })
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy into System Clipboard" }) -- next greatest remap ever : asbjornHaland

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
