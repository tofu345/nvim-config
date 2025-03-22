-- NOTE: vim.bo applies to current buffer only

-- finally read the docs on this
vim.bo.shiftwidth = 2
vim.bo.tw = 79 -- auto break

vim.opt.linebreak = true

vim.keymap.set("n", "<A-p>", "<Cmd>PasteImg<CR>", { buffer = true })
