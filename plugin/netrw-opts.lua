vim.cmd([[
    let g:netrw_keepj = "keepj"
    let g:netrw_banner = 0
    let g:netrw_altfile = 1
    let g:netrw_preview = 1
]])

-- https://www.reddit.com/r/neovim/comments/14e59ub/i_wrote_a_function_that_moves_the_cursor_to_the/
local ex_to_current_file = function()
	-- add current position to jumplist
	vim.fn.search(".", "s")

	local cur_file = vim.fn.expand("%:t")

	-- open netrw and set curpos to cur_file
	vim.cmd(":Ex")
	local linenum = vim.fn.search("^" .. cur_file .. "$", 'n')
	vim.cmd(":keepjumps :" .. tostring(linenum))
end

vim.keymap.set("n", "<leader>pv", ex_to_current_file, { desc = "netrw with cursor on current file" })
