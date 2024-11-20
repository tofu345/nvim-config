local keymap = vim.keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap.set("n", "Q", "<nop>")
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tms<CR>")
-- keymap.set({ "n", "i" }, "<C-c>", "<Esc>")
keymap.set("n", "s", '"_s')
keymap.set("n", "<A-a>", 'gg"+yG')

-- keep cursor centered
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- nav
keymap.set("n", "<A-,>", "<Cmd>bprev<CR>")
keymap.set("n", "<A-.>", "<Cmd>bnext<CR>")
keymap.set("n", "<A-c>", "<Cmd>bd<CR>")
keymap.set("n", "<leader>,", "<Cmd>tabp<CR>")
keymap.set("n", "<leader>.", "<Cmd>tabn<CR>")
keymap.set("n", "<leader>n", "<Cmd>cnext<CR>")
keymap.set("n", "<leader>N", "<Cmd>cprev<CR>")

-- keymap.set("n", "<leader>pv", "<Cmd>Ex<CR>")
keymap.set("n", "<leader>pv", "<Cmd>Oil<CR>")

-- Move highlighted text
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("x", "<leader>p", [["_dP]]) -- pastes without overwriting register
-- copy to system clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- next greatest remap ever : asbjornHaland

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
