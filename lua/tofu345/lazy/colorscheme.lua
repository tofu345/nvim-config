return {
	"rktjmp/lush.nvim",
	dependencies = {
		"rose-pine/neovim",
	},
	config = function()
		require("rose-pine").setup({
			styles = {
				italic = false,
			},
		})

		vim.cmd("colorscheme rose-pine")

		-- Make background transparent
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end,
}
