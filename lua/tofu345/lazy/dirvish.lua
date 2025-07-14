return {
	"justinmk/vim-dirvish",
	dependencies = {
		"tpope/vim-eunuch",
	},
	config = function()
		vim.cmd([[
            let g:dirvish_mode='sort ,^.*[\/],' " netrw like
            let g:dirvish_relative_paths = 0
        ]])

		vim.keymap.set("n", "<leader>pv", "<CMD>Dirvish<CR>", { desc = "File Explorer" })
	end,
}
