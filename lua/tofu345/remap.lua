local keymap = vim.keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap.set("t", "<C-[>", "<C-\\><C-n>")

keymap.set("n", "<C-S-@>", "<C-^>") -- :|

keymap.set("c", "<M-b>", "<S-Left>", { desc = "One WORD Left" })
keymap.set("c", "<M-e>", "<S-Right>", { desc = "One WORD Right" })

keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tms<CR>", { desc = "Open tmux-sessionizer" })

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
