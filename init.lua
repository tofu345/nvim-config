local set = vim.opt
local keymap = vim.keymap

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

keymap.set({ "n", "v", "x" }, "<leader>y", [["+y]], { desc = "Copy into System Clipboard" })
keymap.set({ "n", "v", "x" }, "<leader>d", [["+d]], { desc = "Delete into System Clipboard" })

keymap.set("n", "s", [["_s]])
keymap.set("n", "<C-S-@>", "<C-^>") -- real-prog-dvorak L :|
keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without overwriting unnamed Register" })

keymap.set("c", "<M-b>", "<S-Left>", { desc = "Command Mode: One Word Left" })
keymap.set("c", "<M-e>", "<S-Right>", { desc = "Command Mode: One Word Right" })

keymap.set("t", "<C-[>", "<C-\\><C-n>")

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

require("config.undotree")
require("config.vague")
require("config.dirvish")
require("config.telescope")
require("config.harpoon")
require("config.treesitter")
require("config.lsp")
require("config.dap")
require("config.git")
