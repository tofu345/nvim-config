return {
	"justinmk/vim-dirvish",
	dependencies = {
		"tpope/vim-eunuch",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.cmd([[
            let g:dirvish_mode='sort ,^.*[\/],' " netrw like
            let g:dirvish_relative_paths = 0
            " call dirvish#add_icon_fn({p -> luaeval("
            "     \ (require('nvim-web-devicons').get_icon(vim.fn.fnamemodify('" .. p .. "', ':e')) or '')
            "     \ .. ' '")})
        ]])

		vim.keymap.set("n", "<leader>pv", "<CMD>Dirvish<CR>", { desc = "File Explorer" })
	end,
}
