return {
	"rktjmp/lush.nvim",
	name = "colors",
	lazy = false,
	dependencies = {
		"rose-pine/neovim",
		"Shatur/neovim-ayu",
		"metalelf0/jellybeans-nvim",
	},
	config = function()
		require("rose-pine").setup({
			variant = "main",
			dim_inactive_windows = false,
			extend_background_behind_borders = true,
			enable = {
				migrations = true,
				terminal = true,
				legacy_highlights = true,
			},
			styles = {
				bold = true,
				italic = false,
				transparency = true,
			},
			highlight_groups = {
				Comment = { italic = false },
				CursorLine = { bg = "base" },
				TreesitterContext = { bg = "base" },
				TreesitterContextLineNumber = { bg = "base" },
			},
			groups = {},
		})

		vim.cmd([[colorscheme jellybeans-nvim]])

		-- Make background transparent
		vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "#131416" })
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end,
}
