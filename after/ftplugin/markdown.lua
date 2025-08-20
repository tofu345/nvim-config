-- NOTE: vim.bo applies to current buffer only

vim.bo.tabstop = 2
vim.bo.tw = 79 -- auto break

vim.opt.linebreak = true

vim.keymap.set("n", "<A-p>", "<Cmd>PasteImg<CR>", { buffer = true })
vim.keymap.set("n", "<leader>oo", "yib:silent !eog \"<CR>")

vim.fn.setreg("t", "####")
