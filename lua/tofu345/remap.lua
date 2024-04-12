local keymap = vim.keymap

vim.g.mapleader = " "

keymap.set("n", "Q", "<nop>")
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tms<CR>")
keymap.set({ "n", "i" }, "<C-c>", "<Esc>")
keymap.set("n", "s", '"_s')
keymap.set("n", "<A-a>", "ggVG")

-- keep cursor centered
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Buffer nav
keymap.set("n", "<A-,>", "<Cmd>bprev<CR>")
keymap.set("n", "<A-.>", "<Cmd>bnext<CR>")
keymap.set("n", "<A-c>", "<Cmd>bd<CR>")
-- Tab nav
keymap.set("n", "<leader>,", "<Cmd>tabp<CR>")
keymap.set("n", "<leader>.", "<Cmd>tabn<CR>")

keymap.set("n", "<leader>pv", ":Ex<CR>")

-- Move highlighted text
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("x", "<leader>p", [["_dP]]) -- pastes without overwriting register
keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- next greatest remap ever : asbjornHaland

-- Eandrju/cellular-automaton.nvim
keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")

-- Trouble.lua
keymap.set("n", "<leader>xx", function()
	require("trouble").toggle()
end)

vim.cmd([[ 
    let g:ftplugin_sql_omni_key = '<C-j>'
]])
