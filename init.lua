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
set.hlsearch = false
set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.wrap = false
set.shortmess:append("S") -- show 'search hit BOTTOM, continuing at TOP'
set.swapfile = false
set.foldmethod = "manual"

keymap.set("t", "<C-[>", "<C-\\><C-n>")
keymap.set({ "n", "v", "x" }, "<leader>y", [["+y]], { desc = "Copy into System Clipboard" })
keymap.set({ "n", "v", "x" }, "<leader>d", [["+d]], { desc = "Delete into System Clipboard" })
keymap.set("n", "<C-S-@>", "<C-^>") -- Real programmers dvorak L :|

require("tofu345.undotree")
require("tofu345.vague")
require("tofu345.dirvish")
require("tofu345.mini-pick")
require("tofu345.harpoon")
require("tofu345.luasnip")
require("tofu345.treesitter")
require("tofu345.lsp")
require("tofu345.dap")
require("tofu345.conform")
require("tofu345.git")
