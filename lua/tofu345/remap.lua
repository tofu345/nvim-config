local keymap = vim.keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap.set("t", "<Esc>", "<C-\\><C-n>")

keymap.set("c", "<M-b>", "<S-Left>", { desc = "One WORD Left" })
keymap.set("c", "<M-e>", "<S-Right>", { desc = "One WORD Right" })

keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tms<CR>", { desc = "Open tmux-sessionizer" })
keymap.set("n", "s", '"_s')
keymap.set("n", "<A-a>", 'gg"+yG', { desc = "Copy Entire File into '+' Register (System Clipboard)" })

-- keep cursor centered
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- nav
keymap.set("n", "<A-c>", "<Cmd>bd<CR>", { desc = "Close Current Buffer" })
keymap.set("n", "<A-,>", "<Cmd>bprev<CR>", { desc = "Navigate to Previous Buffer" })
keymap.set("n", "<A-.>", "<Cmd>bnext<CR>", { desc = "Navigate to Next Buffer" })
keymap.set("n", "<leader>,", "<Cmd>tabp<CR>", { desc = "Navigate to Previous Tab" })
keymap.set("n", "<leader>.", "<Cmd>tabn<CR>", { desc = "Navigate to Next Tab" })
keymap.set("n", "<leader>N", "<Cmd>cprev<CR>", { desc = "Navigate to Previous QuickFix" })
keymap.set("n", "<leader>n", "<Cmd>cnext<CR>", { desc = "Navigate to Next QuickFix" })

-- keymap.set("n", "<leader>pv", "<Cmd>Ex<CR>")
keymap.set("n", "<leader>pv", "<Cmd>Oil<CR>", { desc = "Open File Explorer" })

-- Move highlighted text
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Highlighted Text Upwards" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Highlighted Text Downwards" })

keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without overwriting unnamed Register" })
-- copy to system clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy into System Clipboard" }) -- next greatest remap ever : asbjornHaland

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
