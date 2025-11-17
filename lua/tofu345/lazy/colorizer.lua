return {
	"catgoose/nvim-colorizer.lua",
	-- event = "BufReadPre",
	config = function()
		require("colorizer").setup({
			filetypes = {},
			user_commands = true,
			user_default_options = {
				names = false, -- "Name" codes like Blue or red.  Added from `vim.api.nvim_get_color_map()`
			},
		})

		vim.keymap.set("n", "<leader>ct", "<CMD>ColorizerToggle<CR>", { desc = "Colorizer Toggle" })
	end,
}
