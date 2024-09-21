return {
	"rktjmp/lush.nvim",
	dependencies = {
		"rose-pine/neovim",
		"metalelf0/jellybeans-nvim",
	},
	config = function()
		function ColorMyPencils()
			-- Make background transparent
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end

		require("rose-pine").setup({
			styles = {
				italic = false,
			},
		})

		vim.cmd("colorscheme rose-pine")
		-- vim.cmd("colorscheme jellybeans-nvim")

		ColorMyPencils()
	end,
}
