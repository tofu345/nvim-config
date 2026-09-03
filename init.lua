local set = vim.opt
local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd

vim.g.mapleader = " "
vim.g.maplocalleader = " "

set.number = true
set.relativenumber = true
set.scrolloff = 4
set.signcolumn = "yes"
set.winborder = "rounded"

set.shiftwidth = 4
set.softtabstop = -1
set.expandtab = true
set.hlsearch = false
set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.wrap = false
set.shortmess:append("S") -- show 'search hit BOTTOM, continuing at TOP'
set.swapfile = false
set.foldmethod = "manual"

map({ "n", "v", "x" }, "<leader>y", [["+y]], { desc = "Copy into System Clipboard" })
map({ "n", "v", "x" }, "<leader>d", [["+d]], { desc = "Delete into System Clipboard" })

map("n", "J", "mzJ`z")
-- map("v", "J", ":m '>+1<CR>gv=gv")
-- map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "s", [["_s]])
map("n", "<C-S-@>", "<C-^>") -- real-prog-dvorak L :|
map("x", "<leader>p", [["_dP]], { desc = "Paste without overwriting unnamed Register" })

map("c", "<M-b>", "<S-Left>", { desc = "Command Mode: One Word Left" })
map("c", "<M-e>", "<S-Right>", { desc = "Command Mode: One Word Right" })

map("t", "<C-[>", "<C-\\><C-n>")

autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- https://www.youtube.com/watch?v=tBxtnvatFYI
autocmd("FileType", {
    desc = "'q' to close help/quickfix/netrw windows",
    pattern = "help,qf,netrw",
    callback = function()
        map("n", "q", "<C-w>c", { buffer = true, desc = "close help/quickfix/netrw windows" })
    end,
})

require("config.lazy")
