-- NOTE: vim.bo applies to current buffer only

vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.tw = 79 -- auto break

-- these must be global
vim.opt.spell = true
vim.opt.autochdir = true -- for clipboard-image.nvim to avoid putting image in wrong folder

vim.keymap.set("n", "<Space>p", "<Cmd>PasteImg<CR>")
