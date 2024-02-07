local keymap = vim.keymap

vim.g.mapleader = " "

-- s
keymap.set("n", "s", '"_s')

-- open netrw
keymap.set("n", "<leader>pv", ":Ex<CR>")

-- Move highlighted text
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keymap.set("n", "J", "mzJ`z") -- Delete line under text?

keymap.set("n", "<C-a>", "ggVG")

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

-- ??
-- keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- File navigation
keymap.set("n", "<leader>k", ":bnext<cr>")
keymap.set("n", "<leader>j", ":bprevious<cr>")
keymap.set("n", "<leader>d", ":bdelete<cr>")

-- Search and replace word under cursor
keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]])

vim.cmd([[
    " https://stackoverflow.com/questions/676600/vim-search-and-replace-selected-text
    vnoremap <leader>R "hy:%s/\M<C-r>h//gc<left><left><left>
    
    " https://stackoverflow.com/questions/4521818/automatically-insert-a-matching-brace-in-vim
    inoremap {<CR> {<CR>}<Esc>ko
]])

-- Git Signs
keymap.set("n", "<leader>gs", vim.cmd.Git)

-- Make current bash file executable
-- keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

local function quickfix()
	vim.lsp.buf.code_action({
		filter = function(a)
			return a.isPreferred
		end,
		apply = true,
	})
end

keymap.set("n", "<leader>qf", quickfix, opts)

-- Trouble.lua
keymap.set("n", "<leader>xx", function()
	require("trouble").toggle()
end)

-- LuaSnip
-- local ls = require("luasnip")

-- keymap.set({ "i" }, "<C-K>", function()
-- 	ls.expand()
-- end, { silent = true })
-- keymap.set({ "i", "s" }, "<C-L>", function()
-- 	ls.jump(1)
-- end, { silent = true })
-- keymap.set({ "i", "s" }, "<C-J>", function()
-- 	ls.jump(-1)
-- end, { silent = true })
--
-- keymap.set({ "i", "s" }, "<C-E>", function()
-- 	if ls.choice_active() then
-- 		ls.change_choice(1)
-- 	end
-- end, { silent = true })
