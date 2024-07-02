return {
	"mbbill/undotree",
	config = function()
		vim.keymap.set("n", "<leader>u", "<Cmd>UndotreeToggle<CR>")
	end,
}
