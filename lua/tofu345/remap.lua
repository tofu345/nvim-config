local keymap = vim.keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap.set("n", "<leader>pv", "<cmd>Ex<cr>")

keymap.set("t", "<C-[>", "<C-\\><C-n>")

keymap.set("n", "<C-S-@>", "<C-^>") -- Real programmers dvorak L :|

keymap.set("c", "<M-b>", "<S-Left>", { desc = "Command Mode: One Word Left" })
keymap.set("c", "<M-e>", "<S-Right>", { desc = "Command Mode: One Word Right" })

keymap.set("n", "s", '"_s')
keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without overwriting unnamed Register" })
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy into System Clipboard" }) -- next greatest remap ever : asbjornHaland

vim.api.nvim_create_autocmd({ "FileType" }, {
	group = vim.api.nvim_create_augroup("Tabstop_4", {}),
	pattern = { "lua", "go", "make" },
	callback = function()
		vim.opt_local.tabstop = 4
	end,
	desc = "filetypes that want tabs as 4 spaces",
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- https://www.reddit.com/r/neovim/comments/1fwqc8t/comment/lqh201n/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
local spell_types = {}
if #spell_types > 0 then
	vim.api.nvim_create_augroup("Spellcheck", { clear = true })
	vim.api.nvim_create_autocmd({ "FileType" }, {
		group = "Spellcheck", -- Grouping the command for easier management
		pattern = spell_types, -- Only apply to these file types
		callback = function()
			if vim.bo.modifiable then -- ignore vim.lsp.buf.hover() windows
				vim.opt_local.spell = true
			end
		end,
		desc = "Enable spellcheck for defined filetypes",
	})
end
