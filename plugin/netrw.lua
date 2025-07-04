vim.cmd([[
    let g:netrw_keepj = "keepj"
    let g:netrw_banner = 0
    let g:netrw_altfile = 1
    let g:netrw_preview = 1
]])

-- https://www.reddit.com/r/neovim/comments/14e59ub/i_wrote_a_function_that_moves_the_cursor_to_the/
local ex_cursor_on_filename = function()
	-- add current position to jumplist
	vim.fn.search(".", "s")

	local cur_file = vim.fn.expand("%:t")

	vim.cmd(":Ex")
	-- move cursor to filename
	vim.fn.search("^" .. cur_file .. "\\**$") -- executable files have '*' at the end
end

vim.keymap.set("n", "<leader>pv", ex_cursor_on_filename, { desc = "netrw with cursor on current file" })
