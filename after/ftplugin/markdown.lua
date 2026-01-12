-- NOTE: vim.bo applies to current buffer only

vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2

vim.bo.tw = 79 -- auto break
vim.opt.linebreak = true

vim.keymap.set("n", "<A-p>", "<Cmd>PasteImg<CR>", {
	desc = "clipboard-image: Paste image in clipboard to expand(%:p:h)/images/[timestamp].png and put filename",
	buffer = true,
})
vim.keymap.set("n", "<leader>oo", [[yib:!xdg-open %:p:h/"]], { desc = "Open image under cursor", buffer = true })
