-- NOTE: vim.bo applies to current buffer only

vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.tw = 79 -- auto break

vim.keymap.set("n", "<A-p>", "<Cmd>PasteImg<CR>")
