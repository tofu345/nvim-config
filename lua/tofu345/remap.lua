local keymap = vim.keymap

vim.g.mapleader = " "

-- quickfix
keymap.set("n", "<leader>qf", function()
	vim.lsp.buf.code_action({
		filter = function(a)
			return a.isPreferred
		end,
		apply = true,
	})
end)

keymap.set({ "n", "i" }, "<C-c>", "<Esc>")

-- LuaSnip
keymap.set({ "i" }, "<C-K>", function()
	require("luasnip").expand()
end, { silent = true })

-- Buffer navigation
keymap.set("n", "<A-,>", "<Cmd>bprev<CR>")
keymap.set("n", "<A-.>", "<Cmd>bnext<CR>")
keymap.set("n", "<A-c>", "<Cmd>bd<CR>")

-- Tab navigation
keymap.set("n", "<leader>,", "<Cmd>tabp<CR>")
keymap.set("n", "<leader>.", "<Cmd>tabn<CR>")

-- format
keymap.set("n", "<A-f>", "<Cmd>Neoformat<CR>")

-- s
keymap.set("n", "s", '"_s')

-- open netrw
keymap.set("n", "<leader>pv", ":Ex<CR>")

-- keymap.set("n", "J", "<nop>")

-- Move highlighted text
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "<A-a>", "ggVG")

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- pastes without ovewriting register
keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])
keymap.set("n", "<A-v>", "<C-v>")

-- Close file
keymap.set({ "n", "v" }, "<leader>d", [["_d]])

keymap.set("n", "Q", "<nop>")
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tms<CR>")

-- Eandrju/cellular-automaton.nvim
keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")

-- Search and replace word under cursor
-- keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]])

-- Git Signs
keymap.set("n", "<leader>gs", vim.cmd.Git)

-- Make current bash file executable
-- keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Trouble.lua
keymap.set("n", "<leader>xx", function()
	require("trouble").toggle()
end)

vim.cmd([[ 
    let g:ftplugin_sql_omni_key = '<C-j>'
]])
