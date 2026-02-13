return {
	"tpope/vim-vinegar",
	lazy = false,
	config = function()
		vim.cmd([[
	        let g:netrw_altfile = 1
	        let g:netrw_keepj = "keepj"
	    ]])

		-- https://www.reddit.com/r/neovim/comments/14e59ub/i_wrote_a_function_that_moves_the_cursor_to_the/
		local netrw_cursor_on_filename = function()
			vim.fn.search(".", "s") -- add current position to jumplist
			local filename = vim.fn.expand("%:t")

			vim.cmd(":Ex")
			vim.fn.search("^" .. filename) -- move cursor to filename
		end

		vim.keymap.set("n", "<leader>pv", netrw_cursor_on_filename)
	end,
}
